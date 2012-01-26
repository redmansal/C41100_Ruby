#this method prints hello world
def hello_there
    puts "hello world"
end

#this method jpins to strings together and prints to the screen
def get_info_from_user
    puts "Enter some random text"
    random_stuff = gets

    in_one_line = "This is what you just wrote: " + random_stuff.chomp
    puts in_one_line
end
