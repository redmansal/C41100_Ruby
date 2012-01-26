#
# Bank.rb
#
# author:        Colm Nolan 
# last modified: 09 October, 2011
# description:   Bank class


class Bank 
    attr_accessor :bank_name, :no_of_employees, :amount_of_deposits, :amount_of_loans, :nama_status

    def initialize()
        @bank_name = ""
        @no_of_employees = 0
        @amount_of_deposits = 0.0
        @amount_of_loans = 0.0
        @nama_status = false
    end

    def fill_in_details(bank_file_object)
        @bank_name = bank_file_object[0]
        @no_of_employees = bank_file_object[1].to_i
        @amount_of_deposits = bank_file_object[2].to_i 
        @amount_of_loans = bank_file_object[3].to_i

        if bank_file_object[4] == "true"
            @nama_status = true
        else
            @nama_status = false
        end
    end

    def moves_loans_to_nama(nama)

        correct_loans_amount = 0.5 * @amount_of_deposits 
        amount_of_loans_to_move_to_nama = @amount_of_loans - correct_loans_amount

        nama.add_loans(amount_of_loans_to_move_to_nama)

        @amount_of_loans = correct_loans_amount
        @nama_status = true

    end

    def is_bank_solvent?
        if @amount_of_deposits >= @amount_of_loans
            true
        else
            false
        end
    end

    def display_bank_details

        puts @bank_name + "\t" + @no_of_employees.to_s + "\t\t" + @amount_of_deposits.to_s + "\t\t" + @amount_of_loans.to_s + "\t" + @nama_status.to_s 
    end

    def get_bank_name
        return @bank_name
    end

    def make_a_deposit(input)
        @amount_of_deposits = @amount_of_deposits + input
    end
    
    def display_bank_Heading_Details

        75.times do print "-" end
        puts
        puts "BANKS DETAILS"
        puts "Bank Name\t\tEmployee No\tDeposits\tLoans\tNAMA Status"
        75.times do print "-" end
        puts
    end

end


