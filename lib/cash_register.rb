
require "pry"
class CashRegister

  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

 def add_item(title, price, quantity=1)
   @new_price = price * quantity
   new_total = @new_price + @total
   @total = new_total
   quantity.times do
     items << title
   end
  @last_transaction = quantity * price
 end

 def apply_discount
   @total = @total * (1 - (@discount.to_f / 100))

  if @discount > 0
   return "After the discount, the total comes to $#{@total.to_i}."
  else
    return "There is no discount to apply."
  end

 end

 def void_last_transaction
   @total = total - last_transaction
 end

end
