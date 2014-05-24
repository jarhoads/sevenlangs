# get arguments from command line
if ARGV.length == 2
	pattern = Regexp.new(ARGV[0])
	filename = ARGV[1]
	lineNum = 1
	# open file from arguments
	# read lines checking for regex
	File.open(filename,"r") do |file| 
		file.each_line do |line|
			puts "#{lineNum}: #{line}" if line.match(pattern) 
			lineNum += 1
		end
	end
else
	puts "incorrect arguments"
	puts "usage: ruby ruby_grep.rb pattern filename"
end
