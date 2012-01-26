#
# Developer.rb
#
# author:        Colm Nolan 
# last modified: 09 October, 2011
# description:   Developer class
 
 
class Developer

    attr_accessor :name, :net_worth, :loans, :bank_loaned_from, :bankrupt

    def initialize(bank)
        @name = ""
        @net_worth = 0.0 
        @loans = 0.0
        @bank_loaned_from = bank
        @bankrupt = false
    end

    def fill_in_details_about_developer(developer_file_object)
        @name = developer_file_object[0]
        @net_worth = developer_file_object[1].to_i 
        @loans = developer_file_object[2].to_i

        if developer_file_object[3] == "true"
            @bankrupt = true
        else
            @bankrupt = false
        end
     end

    def get_name
        return @name
    end

    def get_bank
        return @bank_loaned_from
    end

    def owes_amount
        return @loans
    end

    def owes_bank
        to_return = @bank_loaned_from.get_bank_name
        return to_return
    end

    def display_developer_details()
        puts @name + "\t" + @net_worth.to_s + "\t\t" + @loans.to_s + "\t" + @bank_loaned_from.get_bank_name + "\t" + @bankrupt.to_s 
    end
    
    def is_developer_solvent?
        if (5 * @net_worth > @loans)
            true
        else
            false
        end
    end
    
    def make_bankrupt

        developers_real_worth = @net_worth - @loans
        @bank_loaned_from.make_a_deposit(developers_real_worth)

        @net_worth = 0.0 
        @loans = 0.0
        @bankrupt = true
    end

    def display_developer_Heading_Details

        75.times do print "-" end
        puts
        puts "DEVELOPER DETAILS"
        puts "Name\t\tNet Worth\tLoans\tBank Loaned From\tBankrupt"
        75.times do print "-" end
        puts
    end
end
