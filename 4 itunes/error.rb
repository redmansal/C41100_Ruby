#!/opt/local/bin/ruby1.9 -w
# UPDATED FOR CATEGORIES
# Copyright Mark Keane, All Rights Reserved, 2010

class MyErr
	attr_accessor :type, :holder, :method
	def initialize(type, holder, method)
		@type = type
		@holder = holder
		@method = method
	end
	
	def do_it
		if @type == "multiple_answer_error"
			then puts "Error: Item #{@holder} raised #{@type} in method: #{@method}"
		elsif @type == "not_found_error"
			then puts "Error: #{@holder} was #{@type} in #{@method}"
		elsif @type == "weird_item"
			then puts "Error:Gave #{@holder} as #{@type} to #{@method} method."
		else puts "Error: Have been given an unknown error type: #{@type}"
		end
	end
	
end
# 
# err = MyErr.new("weird_item", ["dd","dd"], "foo")
# err.do_it
# puts err