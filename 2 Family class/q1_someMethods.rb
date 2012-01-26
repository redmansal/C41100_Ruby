#this method takes an input from the user and then prints it out
def keyboard_line
    puts "Enter some text please"
    input = gets
    puts input
end

#this method tells the user if it is overr 100 it is a big number
def is_it_a_big_number
    puts "Enter a number please:"
    input = gets
    input_number = input.to_i
    if input_number > 100
        puts "That is a big number"
    else
        puts "That is a small number"
  end
end

