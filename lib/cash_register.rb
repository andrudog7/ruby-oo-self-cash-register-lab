require 'pry'

class CashRegister
attr_accessor :total, :discount, :cart, :transaction

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @cart = []
        @transaction = []
    end

    def add_item(title, price, quantity = 1)
        self.total= @total + (price * quantity)    
        quantity.times {@cart << title}
        @transaction << (price * quantity)
    end

    def apply_discount()
        if discount == nil
            return "There is no discount to apply."
        else
        discount_amount = (@discount / 100.to_f) * @total
        self.total= @total - discount_amount
        return "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def items
        return cart
    end

    def void_last_transaction
        if @transaction == []
            self.total = 0.0
        else
        self.total = @total - @transaction[-1]
        end
    end

end

