module ActAsCSV
	def self.included(base)
		puts "adding ClassMethods to class #{base.name}"
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

			file = File.new(self.class.to_s.downcase + '.txt')

			@headers = file.gets.chomp.split(',')

			file.each do |row|
				@csv_contents << row.chomp.split(",")
			end
		end

		attr_accessor :headers, :csv_contents

		def initialize
			puts 'executing initialize'
			read
		end

		#The each function operates ob a CsvRow object so convert the row from csv_contents into a CsvRow before applying the function using yield.
		def each
			@csv_contents.each { |csv_row| yield CsvRow.new(csv_row, @headers) } 
			nil
		end

	end
end

class CsvRow
	#You need to carry the headers with each row as it needs the headers to get the data for a given heading column.
	attr_accessor :data, :headers
	def initialize(array, headers)
		@data = array
		@headers = headers
	end

	def method_missing name, *args
		ndx = @headers.find_index(name.to_s)
		if ndx 
			@data[ndx]
		else
			"no data for column heading"
		end
	end
end

class RubyCSV
	include ActAsCSV
	puts "about to execute acts_as_csv..."
	acts_as_csv
	puts "...done it"
end

m = RubyCSV.new
puts "about to look at headers and csv_contents..."
puts m.headers.inspect
puts m.csv_contents.inspect

puts "about to do each"
puts m.each {|row| puts row.heading2}
puts m.each {|row| puts row.heading999}
puts "finished"