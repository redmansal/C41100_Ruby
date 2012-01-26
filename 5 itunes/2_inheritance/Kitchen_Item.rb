class Kitchen_Item  
    attr_accessor :cost, :size, :weight, :date_of_pruchase, :owner, :brand 
    def initialize(cost, size, weight, date_of_purchase, owner, brand)
        @cost = cost
        @size = size
        @weight = weight
        @year_of_purchase = date_of_purchase
        @owner = owner
        @brand = brand
        
  
    end

    def is_this_item_out_of_date
        if @date_of_purchase.to_i < 2005
           true
        else
           false
        end
    end

    def who_owns_item
        puts "The owner of this item is " << @owner 
    end

    def how_old_is_this_item
        time = Time.new
        item_oldness = time.year - @year_of_purchase 
        item_oldness
    end

    def move_me
        puts "Most items in the kitchen are hard to move such as fridges and sinks"
    end
    
    
    def delete
      
      
    end
 
end

       

