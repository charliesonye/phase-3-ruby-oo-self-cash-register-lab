require 'pry'

class CashRegister
 
    attr_accessor :discount, :total, :list, :items, :last_transaction

    def initialize(discount= 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, optional = 1)
        
        @last_transaction = price * optional
        self.total += optional > 0 ? price * optional : price
        optional.times do
            @items << title
        end
    end
  
    def apply_discount
        if discount > 0
            discount_total = self.total * discount/100.to_f
        self.total = total - discount_total.to_i
       "After the discount, the total comes to $#{total}."
        elsif discount == 0 
            "There is no discount to apply."
        end
    end
    
    def void_last_transaction
        self.total -= last_transaction
    end

end
