#!/usr/bin/ruby -w

# puts "Type of arr_str: #{arr_str.class}"
# puts "[" + line + "]"
# f = File.open("numbers.txt").readlines.each do |line|
# File.readlines("numbers.txt").each do |line|
	# if line.length >= 2 && line.slice(line.length - 2) == ','
		# arr_str << line.slice(0, line.length - 2).to_i
	# end

def my_gnl
	f = File.open("numbers.txt")
	if !f
		return
	end
	arr_str = []
	f.readlines.each do |line|
		arr_str << line.scan(/\d+/).first.to_i
	end
	f.close
	puts arr_str.sort
end
  
my_gnl