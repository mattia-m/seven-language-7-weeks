#write a grep that print the line of a file having occurence of a phrase anywhere in that line

def grep(filename, pattern)
    regexp = Regexp.new(pattern)
    File.open(filename, 'r') do |file|
      file.each_line do |line|
        puts line if line.match?(regexp)
      end
    end
  rescue Errno::ENOENT
    puts "File not found: #{filename}"
end

# Example usage
#grep('path', /pattern/)