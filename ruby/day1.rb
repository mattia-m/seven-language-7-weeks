choosen_number = rand(20)
puts "Input a number between 0 and 20"
user_input = gets.chomp

if !user_input.match?(/\A-?\d+\z/)
    abort("Error encountered. Exiting program.")
end
if user_input.to_i < choosen_number
    puts "Guessed too low"
    exit
elsif user_input.to_i > choosen_number
    puts "Guessed too high"
    exit
elsif user_input.to_i == choosen_number 
    puts "You won"
    exit
end
