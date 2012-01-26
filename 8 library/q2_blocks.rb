#
# q2_blocks.rb
#
# author:        Colm Nolan 
# last modified: 17 November, 2011
# description:   Different examples showing the manipulation of blocks and lambdas

#############################################
#pass in the length of the hyponouse of a right angled triangle and calculate some interesting info 
triangle_block = lambda do |hyp,opp|
  if hyp > 0 && opp > 0 && hyp > opp
    #find the other length in the trinagle
    adj = Math.sqrt((hyp * hyp) - (opp * opp))
    puts "The other length in this trinagle is #{adj}"
    #find the area
    area = (0.5 * adj) * opp
    puts "The area of the triangle is #{area}"

  elsif hyp < 0 || opp < 0
    puts "Wrong Entry, Triangles only have positive measurments"
  else
    puts "Wrong Entry, A right angle tringle must have the other two sides shorter than the hypononuse"
  end
  puts
end

triangle_block.call(5,-50)
triangle_block.call(5,4)
triangle_block.call(100,33)

triangle_block.call(232,12)
triangle_block.call(232,456)

##################################################

#strange slanted number pyramid
def keep_growing
  puts "call"
  x = 1
  y = 1
  for ss in 1...100
    yield(x,y)
    x *= 8
    y *= 4
  end
end

puts "The great slanted number pyramid"
keep_growing {|k, n| puts "upup#{k} upup#{n}"}

##########################################

#defining a method that takes in as parameter a code block
#the method then uses that codeblock to print out the days of the week
def week_day(&block)
  ["Sunday","Monday", "Tuesday","Wednesday","Thurseday","Friday","Saturday"].each do |week_day|
    block.call(week_day)
  end
end


week_day {|day| puts day}

week_day {|day| puts "The day I will dance is #{day}"}


###############################
#method that takes in a code block and then does stuff to the data in this method
def random_stuff1(&block)
  rainbow = ["Red", "Orange", "Yellow","Green","Blue","Indigo", "violet"];
  stuff = 10
  second = "Mondays"
  block.call(stuff,second,rainbow)
end

#this method call passes all the code to the method deffinition
random_stuff1  do |endit, second, colour_in_the_sky|   
  for count in 1...endit
   puts count 
   sleep 0.5
  end

  puts "I dont like #{second}"

  puts colour_in_the_sky
end

#############################










