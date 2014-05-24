module ActsAsCsv
	def self.included(base)
		base.extend ClassMethods
	end

	module ClassMethods
		def acts_as_csv
			include InstanceMethods
		end
	end

	module InstanceMethods
		def read
			@csv_contents = []
			filename = self.class.to_s.downcase + '.txt'
			file = File.new(filename)
			@headers = file.gets.chomp.split(', ')

			@headers_hash = {}
			(1..@headers.count).each {|i| @headers_hash[headers[i-1]] = i}

			file.each do |row|
				@csv_contents << row.chomp.split(', ')
			end
		end

		attr_accessor :headers, :csv_contents
		def initialize
			read
		end

		def each
			csv_contents.each {|row| yield CsvRow.new(row,@headers_hash)}
		end

	end

	class CsvRow

		def initialize(row, hdrs)
			@nums = hdrs
			#hdrs = InstanceMethods.headers
			#(1..hdrs.count).each {|i| @nums[hdrs[i-1]] = i}
			@row = row
		end

		def method_missing col, *args
			column = col.to_s
			@row[@nums[column]-1]
		end


	end

end

class RubyCsv
	include ActsAsCsv
	acts_as_csv
end