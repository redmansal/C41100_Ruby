# To change this template, choose Tools | Templates
# and open the template in the editor.


require '../lib/dog.rb'
require '../lib/cat.rb'
#making a new object rover
rover = Dog.new("rover", "collie",30)

#this method will call because fetch is a public method
rover.fetch

#rollover will not call because it is a private method and can only be call from a method within the object
begin
rover.rollover
rescue => msg  
   puts "Something went wrong ("+msg.to_s+")"  
end  

#chase_your_tail will not call because it is protected and can only be called from a method within the object
begin
rover.chase_your_tail
rescue => msg  
   puts "Something went wrong ("+msg.to_s+")"  
end  

#the sit method will work because it is public. The method rollover will now be called within the method sit 
#so it will now work
rover.sit

madmax = Dog.new("madmax", "bichon",22)

#method call that works because racing_speed call in race is only protected, if was private it would not work
#animal.racing_speed works because rover and madmax are the same type of object Dog
rover.race(madmax)


#method call that does not work because racing_speed_private call in race2 has been declared a private method
#for animal.racing_speed_private to work it needs be called from within it's own instance 
begin
rover.race2(madmax)
rescue => msg  
   puts "Something went wrong ("+msg.to_s+")"  
end  

#making a cat object
felix = Cat.new("felix", "persion", 10)

#race method call does not work because the protected method racing_speed in the felix object 
#is only callable when in an object of type Cat
begin
madmax.race(felix)
rescue => msg  
   puts "Something went wrong ("+msg.to_s+")"  
end  
