class CashRegister

    attr_accessor :total, :discount, :items, :transaction

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity=1)
        @total += price * quantity
        quantity.times do
            @items << item
        end
        self.transaction = price * quantity
    end

    def apply_discount
        if @discount
            @total = @total * (100 - @discount) / 100
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total = @total - self.transaction
    end
end

