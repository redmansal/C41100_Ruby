class Kitchen_Utensil < Kitchen_Item

    attr_accessor :cost, :size, :weight, :date_of_pruchase, :owner, :brand, :type_of_utensil, :utensil_storage_location
    def initialize(cost, size, weight, date_of_purchase, owner, brand,  type_of_utensil, utensil_storage_location)
        @cost = cost
        @size = size
        @weight = weight
        @year_of_purchase = date_of_purchase
        @owner = owner
        @brand = brand

        @type_of_utensil = type_of_utensil
        @utensil_storage_location = utensil_storage_location
    end

    def where_do_i_keep_my_utensil
        @utensil_storage_location
    end

    def move_me
        puts "It is generally OK to move me arround a bit"
    end
end
