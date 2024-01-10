#let's recap the ruby language fundamentals using the ActsAsCsv class from the book

=begin
this is the example of the class, before we can proceed to do the same functionality using modules
  class ActsAsCsv
    def read 
        file = new File.new(self.class.to_s.downcase + '.txt')
        @headers = file.gets.chomp.split(', ')
        
        file.each do |row|
            @result << row.chomp.split(', ')
        end
    end

    def headers
        @headers
    end

    def csv_contents
        @result
    end

    def initialize
        @result = []
        read
    end
end
=end

class CsvRow
    def initialize(headers, row_data)
        @headers = headers
        @row_data = row_data
    end
  
    def method_missing(name, *args)
        index = @headers.index(name.to_s)
        if index
            @row_data[index]
        else
            super
        end
    end
  
    def respond_to_missing?(name, include_private = false)
        @headers.include?(name.to_s) || super
    end
end
  

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
        
            file.each do |row|
              @csv_contents << row.chomp.split(', ')
            end
        end

        def each
            @csv_contents.each do |row|
              yield CsvRow.new(@headers, row)
            end
        end

        attr_accessor :headers, :csv_contents
        def initialize
            read
        end
    end
end

class RubyCsv 
    include ActsAsCsv
    acts_as_csv
end

#As instructed we should override the method_missing method to retrieve the value of the provided header
#our target is  
#given the following csv
# one,two
# lions,tiger
# csv = RubyCsv.new
# csv.each {|row| puts row.one}  
# should print lions

csv = RubyCsv.new
puts csv.headers.inspect
csv.each do |row|
  puts row.one  
end