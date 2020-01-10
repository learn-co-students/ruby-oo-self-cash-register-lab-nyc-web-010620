class CashRegister
    attr_accessor :total, :discount, :quantity, :items, :last_transaction, :price 
    attr_reader :title

    # discount is optional, so we pass it in as an argument with a default value
    # we make total a constant since we want the total of every instance of CashRegister to always start at 0
    # thus, we don't pass the total in as an argument; we can just set it equal to 0 
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end 

    # unless specified, the quantity of any given item we add to our cart is 1 
    def add_item(title, price, quantity = 1)
        @total += price * quantity 
        # the above is equivalent to the below
        # @total = @total + (price * quantity)
        @last_transaction = price * quantity 
        # we need to add every item into our items array, even if they are the same thing
        # so we want to run the below block as many times as the number of the quantity of the item added
        quantity.times do
            @items << title 
        end 
    end 

    # think about how a discount works - it is usually for a certain percentage off your total
    def apply_discount
        if discount != 0
            # if it helps, think of a mathematical example 
                # ex: total = 100, discount = 10 (this is a percent)
            # to get from the discount percentage to a decimal (or float), we divide the percentage amount by 100
                # from the example , to calculate the discounted total, I would do the below math:
                    # 100-(100*(10/100))
            # to now see the dollar amount that you get off the total, multiply the total by the discount float
            # now, to get the discounted total, we subtract the discount (dollar) amount from the total 
            #the above can be represented by code as follows:
                # discount_float = discount / 100
                # discount_amount = total * discount_float
                # @total = total - discount_amount 
            @total = (total - (total*discount)/100)
            "After the discount, the total comes to $#@total."
        else 
            "There is no discount to apply."
        end 
    end 

    def items
       @items 
    end 

    # Hint: The void_last_transaction method will remove the last transaction 
    # from the total. You'll need to make an additional attribute accessor and 
    # keep track of that last transaction amount somehow. 
    # In what method of the class are you working with an individual item? >>> add_item 
    def void_last_transaction
        @total -= @last_transaction 
    end 

end 
