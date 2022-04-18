#!/usr/bin/ruby -w

def erehw
	if (ARGV.count != 1)
			return
	end

	capitals = {
		"OR" => "Salem",
		"AL" => "Montgomery",
		"NJ" => "Trenton",
		"CO" => "Denver"
	}
	states = {
		"Oregon"		=> "OR",
		"Alabama"		=> "AL",
		"New Jersey"	=> "NJ",
		"Colorado"		=> "CO"
	}
	name		= ARGV[0]
	capitals	= capitals.invert
	states		= states.invert
	info		= "Unknown capital city"

	if capitals[name] != nil
		info = states[capitals[name]]
	end
	puts info
end

erehw