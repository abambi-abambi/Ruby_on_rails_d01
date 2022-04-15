#!/usr/bin/ruby -w

def my_var
	a = 10
	b = "10"
	c = nil
	d = 10.0

	puts "my variables : \n" +
	"\ta contains: #{a.inspect} and is a type: #{a.class}\n" +
	"\tb contains: #{b} and is a type: #{b.class}\n" +
	"\tc contains: #{c.inspect} and is a type: #{c.class}\n" +
	"\td contains: #{d.inspect} and is a type: #{d.class}"
end

  my_var
