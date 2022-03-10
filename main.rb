# Caesar's Cypher by Logan Hosoda

# Note: "A" - "Z" == 65 - 90
# "a" - "z" == 97 - 122

# Input string for word, and integer for amount of characters to shift.
# Output the result of the shift
def caesar_cypher(word, offset)
	word_conversion = string_to_integer(word)
	shifted_numbers = number_shift(word_conversion, offset)
	number_conversion = integer_to_string(shifted_numbers)
	p number_conversion
end 

# Input string, output array of numbers
def string_to_integer(string)
	split_string = string.split("")
	char_values = split_string.map {|char| char.ord}
	char_values
end

# Input array of numbers, apply shift in either direction
def number_shift(array_of_numbers, offset)
	if offset > 25 || offset < -25
		puts "ERROR! Exceeded maximum allowable shift of +/- 25 characters!"
		puts "Exiting program now."
		exit
	end

	shifted_numbers = array_of_numbers.map do |number|
		if number >= 65 && number <= 90 # Modifies numbers between bracket
			new_number = number + offset
			if new_number > 90 # Resets to 'A' if beyond 'Z'
				new_number - 26
			elsif new_number < 65 # Resets to 'Z' if beyond 'A'
				new_number + 26
			else
				new_number # Default
			end
		elsif number >= 97 && number <= 122 # Modifies numbers between bracket
			new_number = number + offset
			if new_number > 122 # Resets to 'a' if beyond 'z'
				new_number - 26
			elsif new_number < 97 # Resets to 'z' if beyond 'a'
				new_number + 26
			else 
				new_number # Default
			end
		else
			number # Default
		end 
	end
	shifted_numbers
end

# Input shifted numbers, convert back into string, and output result
def integer_to_string(integer)
	int_values = integer.map {|num| num.chr}
	new_string = int_values.join("")
	new_string
end

puts "--- Caesar's cypher by Logan Hosoda ---"
puts "Please enter a word/phrase to convert: "
word = gets.chomp
puts "You entered: #{word}"
puts "Please enter a number to shift each letter +/- 25: "
number = gets.chomp.to_i
if number.class != Integer
	puts "ERROR! Entry must be a number!"
	puts "Exiting program now."
	exit
end
puts "You entered: #{number}"
puts "Your converted word/phrase: "
caesar_cypher(word, number)