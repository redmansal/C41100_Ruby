class Knife < Kitchen_Utensil
    attr_accessor :cost, :size, :weight, :date_of_pruchase, :owner, :brand, :type_of_utensil, :utensil_storage_location, :type_of_knife, :sharpness_index, :handle_type
    def initialize(cost, size, weight, date_of_purchase, owner, brand,  type_of_utensil, utensil_storage_location, type_of_knife, sharpness_index, handle_type)
        @cost = cost
        @size = size
        @weight = weight
        @year_of_purchase = date_of_purchase
        @owner = owner
        @brand = brand

        @type_of_utensil = type_of_utensil
        @utensil_storage_location = utensil_storage_location
        
        @type_of_knife = type_of_knife
        @sharness_index = sharpness_index
        @handle_type = handle_type
    end

    def does_knife_need_to_be_sharpened
        if @sharpness_index.to_i < 5
            true
        else
            false
        end
    end

    def move_me
        puts "It dangerous to wave me arround to much. You could cut someone" 
    end

end


