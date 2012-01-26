#
# q2_familyclass.rb
#
# author:        Colm Nolan 
# last modified: 30 September, 2011
# description:   FamilyMember class on which all the family members objects are instances of 

class FamilyMember
    #status 1 means a parent status 2 means a child status 3 means a pet
    attr_accessor :fname, :lname, :sex, :status, :status_description, :age, :phone_number 
	
    def initialize(fname, lname, sex, status, status_description, age, phone_number)
        @fname = fname
        @lname = lname
        @sex = sex
        @status = status
        @status_description = status_description
        @age = age
        @phone_number = phone_number
    end

    def child?
        if @status == 2
            puts "This family member is a child"
        else
            puts "This family member is not a child"
        end
        puts "This family member is a " + @status_description 
        puts
    end

    def parent?
        if @status == 1
            puts "This family member is a parent"
        else
            puts "This family member is not a parent"
        end
        puts "This family member is a " + @status_description 
        puts
    end

end

