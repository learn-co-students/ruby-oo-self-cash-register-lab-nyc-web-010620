class CashRegister
    attr_accessor :total, :employee_discount, :items, :last_transcation

    def initialize(employee_discount=nil)
        @total = 0
        @employee_discount = employee_discount
        @items = []
        @last_transcation = []
    end

    def discount 
        self.employee_discount
    end

    def add_item(title, price, quantity=1)
        self.last_transcation = [title, price ,quantity]
        quantity.times {self.items << title}
        self.total += (price * quantity)
    end

    def apply_discount
        return "There is no discount to apply." if self.employee_discount == nil

        self.total -= ((self.total * discount) / 100)
        
       "After the discount, the total comes to $#{self.total}."
    end

    def void_last_transaction
        self.total -= (self.last_transcation[1] * self.last_transcation[2])
    end
end
