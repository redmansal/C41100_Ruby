#
# main.rb
#
# author:        Colm Nolan 
# last modified: 09 October, 2011
# description:   This program simulated dealing with insolvent banks and developers and how NAMA is involved
#                This is the main calling file. It declares an array of 5 bank objects, 5 developer objects and a nama object
#                It takes in each objects data from the CSV files.
#                It checks each bank to ensure they are solvent and if not the loans are tranferred to NAMA
#                Each developer is checked for solvency and if not the losses are passed onto their bank
#                In turn each bank is checked for solvency and if they are not solvent loans are moved to NAMA
#
#                Banking Conditions
#                Banks are only considered solvent when there loans are half the size of their deposits
#                Developers are only considered solvent when there loans do not exceed 5 times their net worth

 
require "CSV"
require "Bank.rb"
require "Developer.rb"
require "other.rb"
require "Nama.rb"

bank_file_array = CSV.read('banks.csv')
develepors_file_array = CSV.read('developers.csv')

#make a nama object to track how many loans are on its books
nama = Nama.new


#make an array of 5 bank objects
bank = []
[0,1,2,3,4].each {|element| bank[element] = Bank.new} 

#fill in the details about all 5 banks
i = 0
bank.each do |item|
    item.fill_in_details(bank_file_array[i])
    i = i + 1
end

#make an array of 5 developer objects
developer = []
[0,1,2,3,4].each {|element| developer[element] = Developer.new(bank[element])} 

#fill in the details about all 5 developers
i = 0
developer.each{|item|
    item.fill_in_details_about_developer(develepors_file_array[i])
    i = i + 1
}

20.times do puts end

75.times do print "-" end
puts
puts "Banking Conditions"
75.times do print "-" end
puts
puts "Banks are only considered solvent when there loans are half the size of their deposits"
puts "Developers are only considered solvent when there loans do not exceed 5 times their net worth"
puts

#display all bank details
bank[0].display_bank_Heading_Details()
bank.each {|item| item.display_bank_details}

puts

#display all developer details
developer[0].display_developer_Heading_Details()
developer.each {|item| item.display_developer_details}

2.times do puts end

puts "NAMA loans: " + (nama.get_total_nama_loans).to_s
puts
#p developer
#p bank
#checking if banks are solvent and taking approprate action banks are concidered solvent if their deposits is twice as much as there loans 
#if they are not solvent extra loans is moved into NAMA
bank.each{|item|
    check_if_bank_is_solvent(item,nama)
}


2.times do puts end

#display all bank details

bank[0].display_bank_Heading_Details()
bank.each {|item| item.display_bank_details}


2.times do puts end

puts "NAMA loans: " + (nama.get_total_nama_loans).to_s

2.times do puts end

#print out how much each developer owes
developer.each{|element|
    puts element.get_name + " owes the following amount:   \t" + (element.owes_amount).to_s
}

2.times do puts end

#print out the developers name and the bank he/she owes
developer.each do |element|
    puts element.get_name + " owes money to the following bank:   \t" + element.owes_bank
end


2.times do puts end

#check if the developer is solvent (ie their loans is not over 5 times the value of their net worth)
developer.each{|element|
    if element.is_developer_solvent?
        puts "Dont worry " + element.get_name + " is solvent"
    else
        puts element.get_name + " needs to be made bankrupt"
        #the method below will make the developer bankrupt, see how this affects the bank involved including if it will need to be nama'd

        puts "Do you want to make this developer bankrupt and leave him/her with nothing?(y for yes and n for no)"
        ans = gets.chomp

        if ans == "y"
            element.make_bankrupt
            check_if_bank_is_solvent(element.get_bank,nama)
        else
            puts "This developer will remain insolvent"
        end
    end
}
puts
puts

#display all bank details
bank[0].display_bank_Heading_Details()
bank.each {|item| item.display_bank_details}

puts
puts

#display all developer
developer[0].display_developer_Heading_Details()
developer.each {|item| item.display_developer_details}
puts
puts
puts "NAMA loans: " + (nama.get_total_nama_loans).to_s
