require 'pry'


class CashRegister
    attr_reader :discount
    attr_accessor :total
    attr_accessor :items


    def initialize(employee_discount=nil)
        @total = 0
        @discount = employee_discount
        if @discount
            @discount_message = "After the discount, the total comes to $"
        else
            @discount_message = "There is no discount to apply."
        end
        @items = []
        @items_prices = []
        @items_nums = []
    end

    def add_item(title,price,num=1)
        @total += price * num
        @items += [title] * num
        @items_prices += [price] * num
        @items_nums << num
    end

    def apply_discount
        if @discount
            @total -= @total * @discount/100
            @discount_message += "#{@total}."
        end
        @discount_message
    end

    def void_last_transaction
        @num = @items_nums.pop
        @items = @items[0..-(@num + 1)]
        @total -= @items_prices[-@num..-1].sum
        @items_prices = @items_prices[0..-(@num+1)]
    end


end