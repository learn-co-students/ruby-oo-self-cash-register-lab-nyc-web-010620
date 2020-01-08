require "pry"

class CashRegister
  
  attr_accessor :total, :discount, :items, :last_item
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end 
  
  def add_item(title,price,quantity = 1)
    i = 0 
    @total += price * quantity
    @last_item = price * quantity
      while i < quantity
        @items.push(title)
        i += 1 
      end 
  end 
  
  def apply_discount()
    if @discount > 0 
      @discount = @discount/100.to_f
      @total = @total - (@total * @discount)
        return "After the discount, the total comes to $#{@total.to_i}."
    end 
    return "There is no discount to apply."
  end 
  
  def void_last_transaction
    @total -= @last_item
  end 
 
end 

