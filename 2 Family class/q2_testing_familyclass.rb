#
# q2_testing_familyclass.rb
#
# author:        Colm Nolan 
# last modified: 30 September, 2011
# description:   This file shows the instanation of 6 objects and then uses methods child and parent to check if the object is a child or a parent
 
require "q2_familyclass.rb"
fm1 = FamilyMember.new("Jill","House","f", 1, "mother","35","0872342342")
fm2 = FamilyMember.new("David","House","m", 1, "father","36","085456746")
fm3 = FamilyMember.new("Damien","House","m", 2, "son","10","0832453245")
fm4 = FamilyMember.new("Sarah","House","f", 2, "daughter","6","083245234")
fm5 = FamilyMember.new("Shep","House","m", 3, "dog","3","0862523425")
fm6 = FamilyMember.new("Kate","House","f", 2, "daughter","4","08528349213")

puts
puts "Checking to see if this family member is a child"
fm1.child?
fm2.child?
fm3.child?
fm4.child?
fm5.child?
fm6.child?

puts
puts "Checking to see if this family member is a parent"
fm1.parent?
fm2.parent?
fm3.parent?
fm4.parent?
fm5.parent?
fm6.parent?

