#!/usr/bin/ruby -w

def whereto
	if (ARGV.count != 1)
		return
	end

	states = {
		"Oregon"		=> "OR",
		"Alabama"		=> "AL",
		"New Jersey"	=> "NJ",
		"Colorado"		=> "CO"
	}
	capitals = {
		"OR" => "Salem",
		"AL" => "Montgomery",
		"NJ" => "Trenton",
		"CO" => "Denver"
	}
	arg = ARGV[0].split(",")
	arr = []

	arg.each do |line|
		arr << line.strip.capitalize
	end

	# puts arr
	# puts arg

	arr.each do |line|
		if states[line] != nil
			puts  capitals[states[line]] + " is the capital of " + line + " (akr: " + states[line] + ")"
		elsif capitals.invert[line] != nil
			puts  line + " is the capital of " + states.invert[capitals.invert[line]] + " (akr: " + capitals.invert[line] + ")"
		else
			if !line.empty?
				puts "#{line} is neither a capital city nor a state"
			end
		end
	end
end

whereto