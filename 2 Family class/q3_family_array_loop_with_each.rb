#
# q3_family_array_loop_with_each.rb
#
# author:        Colm Nolan 
# last modified: 30 September, 2011
# description:   This file makes an array of family member objects and then it is itterated through using each to the name and status can be printed
 
require "q2_familyclass.rb"

family = []
family[0] = FamilyMember.new("Jill","House","f", 1, "mother","35","0872342342")
family[1] = FamilyMember.new("David","House","m", 1, "father","36","085456746")
family[2] = FamilyMember.new("Damien","House","m", 2, "son","10","0832453245")
family[3] = FamilyMember.new("Sarah","House","f", 2, "daughter","6","083245234")
family[4] = FamilyMember.new("Shep","House","m", 3, "dog","3","0862523425")
family[5] = FamilyMember.new("Kate","House","f", 2, "daughter","4","08528349213")

family.each {|item|
    puts "First Name: " + item.fname
    puts "Last Name: " + item.lname
    if item.status == 1
        puts "Status: Parent"
    elsif item.status == 2
        puts "Status: Child"
    else
        puts "Status: Pet"
    end

    puts
    puts
}  
