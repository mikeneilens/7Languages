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