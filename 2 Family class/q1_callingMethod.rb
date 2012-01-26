#
# q1_callingMethod.rb
#
# author:        Colm Nolan 
# last modified: 30 September, 2011
# description:   This file contains methods which call other methods from 2 different files


require 'q1_someMethods' 
require 'q1_someMoreMethods'

#this method calls the other methods from the different files
def method_that_calls_the_other_methods
    puts "Do you Want to run the keyboard_line method(use y for yes or n for no)"
    input = gets.chop
    if (input == 'y') 
        keyboard_line
    else
        puts "No method was ran"
    end

    puts "Do you Want to run the rest of the methods"
    input = gets.chop
    if (input == 'y')
    is_it_a_big_number
    hello_there
    get_info_from_user

    else
        puts "the other methods were not ran"
    end
end

method_that_calls_the_other_methods

