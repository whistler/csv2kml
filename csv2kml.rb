#!/usr/bin/env ruby
#---------Convert CSV to KML------------
#
#

input_file = ARGV[0]
output_file = ARGV[1]
name = ARGV[2] || 'untitled'
description = ARGV[3]

output=open(output_file,"w")

header='<kml xmlns="http://www.opengis.net/kml/2.2">
  <Document>
    <name>' + name + '</name>
    <description>' + description + '</description>
    <Style id="yellowLineGreenPoly">
      <LineStyle>
        <color>7f00ffff</color>
        <width>4</width>
      </LineStyle>
      <PolyStyle>
        <color>7f00ff00</color>
      </PolyStyle>
    </Style>
    <Placemark>
      <name>' + name + '</name>
      <description>' + description + '</description>
      <styleUrl>#yellowLineGreenPoly</styleUrl>
      <LineString>
		<coordinates>
'

footer='
</coordinates>
      </LineString>
    </Placemark>
  </Document>
</kml>
'

output.puts header

counter = 0

File.open(input_file,'r') do |infile|
	while(line=infile.gets)
		counter=counter+1
		output.puts line
	end
end

output.puts footer
