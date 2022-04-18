#!/usr/bin/ruby -w

def where
    if (ARGV.count != 1)
        return
    end

	states = {
		"Oregon"		=> "OR",
		"Alabama"		=> "AL",
		"New Jersey"	=> "NJ",
		"Colorado"		=> "CO"
	}

	capitals_cities = {
		"OR" => "Salem",
		"AL" => "Montgomery",
		"NJ" => "Trenton",
		"CO" => "Denver"
	}

	one_state	= ARGV[0]
	str			= "Unknown state"
	if states[one_state] != nil
		str = capitals_cities[states[one_state]]
	end
	puts str
end

where