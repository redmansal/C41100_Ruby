#
# test_run.rb
#
# author:        Colm Nolan 
# last modified: 21 October, 2011
# description:   Testing inheritance using the heirachy A(Kitchen_item) being the parent
#                B(Kitchen_Utensil) beign the child of A
#                C(Knife) being child of B
require "Kitchen_Item.rb"
require "Kitchen_Utensil.rb"
require "Knife.rb"

#this represents an instance of class A(Kitchen_Item)
kitchen_item = Kitchen_Item.new(499.99,600,200,2008, "Liam Ritchie","Fake Brand")
kitchen_item.move_me

#this represents an instance of class B(Kitchen_Utensil)
kitchen_utensil = Kitchen_Utensil.new(250.99,400,300,2005,"Jill Williams", "Nice Utensil Brand", "fork", "drawer")
kitchen_utensil.move_me

#this represents an instance of class C(knife)
knife = Knife.new(29.99,200,400,2003,"Jimmy Doyle", "Sharp knife Brand", "knife", "drawer", "bread knife", 4, "wooden")
knife.move_me

5.times do puts end

#testing that class C inherits methods from class A
knife.who_owns_item
puts "This item is " << (knife.how_old_is_this_item).to_s << " years old."
if knife.is_this_item_out_of_date
    puts "this item is getting old"
else
    puts "this item is still quite new"
end

#testing if I can call methods in classes Kitchen_utensil(B) and Knife(C) from an instance of class Kitchen_Item(A)
#first kitchen utensil and knife will be called to proove they work
kitchen_utensil.where_do_i_keep_my_utensil

if knife.does_knife_need_to_be_sharpened    
    puts "This knife is blunt and needs to be sharpened"
else
    puts "This knife is still nice and sharp"
end

#next i will try call the class A object and methods that are only in Kitchen_utensil(B) and Knife(C) this will 
#throw an error because these methods to not apply u the heirerarcy. It declares an undefined method whic it is
#rescue will capture the message 

begin
kitchen_item.where_do_i_keep_my_utensil
rescue => msg  
   puts "Something went wrong ("+msg.to_s+")"  
end  



begin
kitchen_item.does_knife_need_to_be_sharpened    
rescue => msg  
   puts "Something went wrong ("+msg.to_s+")"  
end  