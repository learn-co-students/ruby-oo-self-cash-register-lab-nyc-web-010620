class CashRegister
    attr_accessor :total, :discount, :transactions, :items
    @@all = []
    def initialize (discount=nil)
        @total=0
        @discount= discount
        @transactions = []
        @items = []
        @@all << self
    end

    def self.all
        @@all
    end

    def add_item(title, price, quantity=1)
        @total += price * quantity
        quantity.times do @items << title end
        @transactions << (price * quantity)
    end

    def apply_discount
        if @discount != nil
            @total -= (@total * @discount) / 100
             return "After the discount, the total comes to $#{@total}."
        else
            @total
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total -= @transactions[-1]
      end 


end