#
# Nama.rb
#
# author:        Colm Nolan 
# last modified: 09 October, 2011
# description:   NAMA class
 
 
class Nama

    attr_accessor :total_loans

    def initialize()
        @total_loans = 0.0
    end

    def get_total_nama_loans
        return @total_loans
    end

    def add_loans(input)
        @total_loans = @total_loans + input
    end

end


