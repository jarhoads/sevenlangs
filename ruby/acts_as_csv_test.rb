# acts_as_csv_module test

require_relative 'acts_as_csv_module'

def csvTest

	m = RubyCsv.new

	puts "csv file information:"
    puts " "
    puts "headers:"
	puts m.headers.inspect
    puts " "
    puts "contents:"
    puts m.csv_contents.inspect
    puts " "
    puts "rows:"
    m.csv_contents.each {|row| puts "#{row}"}

    puts " "
    puts "Testing m.each { |row| puts row.one }"
    m.each { |row| puts row.one }

    puts "Testing m.each { |row| puts row.two }"
    m.each { |row| puts row.two }
end

csvTest