#!/usr/bin/ruby -w

def style_elements()
	style = "<style>
	body {
		background-color: #FFFFFF;
	}
	h1 {
		text-align: center;
	}
	h4 {
		text-align: left;
	}
	li {
		font-size: 9px;
	}
	table {
		text-align: left;
		border-collapse: collapse;
		margin: auto
	}
	td {
		border: 1px solid black;
		padding: 2px;
		vertical-align: top;
	}
	.red {
		background-color: #DDA0DD;
	}
	.orange {
		background-color: #FFD700;
	}
	.yellow {
		background-color: #FFFACD;
	}
	.green {
		background-color: #9ACD32;
	}
	.blue {
		background-color: #1E90FF;
	}
	</style>"
	return style
end

def cell_color(pos)
	style	= ""
	if pos == "0"
		style = "class=\"yellow\""
	elsif pos == "1"
		 style = "class=\"orange\""
	elsif pos == "17"
		 style = "class=\"blue\""
	elsif pos == "16"
		 style = "class=\"red\""
	else
		 style = "class=\"green\""
	end
	return (style)
end

def cell_maincontent(html, line_border, style, name, body, i)
	html.write(line_border + "<td " + style + ">")
	html.write("<h4>" + name + "</h4>")
	html.write("<ul>")
	body.each do |info|
		html.write("<li>" + info + "</li>")
	end
	html.write("</ul></td>")
	i = i + 1
	return i
end

def table_html(html, column, line, i)
	line_border	= ""
	arr			= line.split("=")
	name		= arr[0]
	body		= arr[1].split(",")
	pos			= body[0].split(":")[1]

	if column == 0
		line_border = "<tr>"
	end

	if pos.to_i == column
		i = cell_maincontent(html, line_border, cell_color(pos), name, body, i)
	else
		html.write("<td>&nbsp;</td>")
	end

	if column == 17
		line_border = "</tr>"
	else
		line_border = ""
	end

	html.write(line_border)

	return i
end

def create_table()
	if File.file?("periodic_table.html") == true
		File.delete("periodic_table.html")
	end
	html = File.new("periodic_table.html", "w")
	if File.file?("periodic_table.txt") == true
		text = File.open("periodic_table.txt", "r")
	else
		return
	end

	html.write("\
	<!DOCTYPE html>
	<html lang=\"en\">
	<head>
		<meta charset=\"utf-8\">
		<title>Periodic Table</title>")
	html.write(style_elements)
	html.write("\
	</head>
	<body>
	<h1>Periodic Table</h1>
	<table>")

	lines	= text.readlines
	period	= [1, 2, 3, 4, 5, 6, 7]
	arr		= [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]
	i		= 0

	period.each do |perio|
		arr.each do |column|
			i = table_html(html, column, lines[i], i)
		end
	end

	html.write("</table>
	</body>
	</html>")
	html.close
	text.close
end

create_table