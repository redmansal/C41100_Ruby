#
# other.rb
#
# author:        Colm Nolan 
# last modified: 09 October, 2011
# description:   miscelaneous methods concerned with the view and that are used often to help minimize code duplication
 
 
def 
    check_if_bank_is_solvent(bank , nama)
        ans = ""
        if bank.is_bank_solvent?
            puts bank.get_bank_name + " is solvent(Well for now anyway!!)"
        else
            puts bank.get_bank_name + " is not solvent"
            puts "Do you want to leave this bank with twice as many deposits as loans and declare it NAMA'd(enter y for yes or n for no)"
            ans = gets.chomp
            if ans == "y"
                bank.moves_loans_to_nama(nama)
            else
                puts "This bank has not been NAMA'd but could run out of money soon"
            end
        end
end

