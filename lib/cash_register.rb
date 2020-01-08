class CashRegister

  attr_accessor :total, :discount, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity= 1)
    i = 0
    @total += price * quantity
    @last_item = price * quantity
    while i < quantity
      @items << title
      i += 1
    end
  end

  def apply_discount
    if @discount > 0
      @discount  = @discount/100.to_f
      @total = @total - (@total * @discount)
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  #def items
    #@items
  #end

  def void_last_transaction
  @total -= @last_item
end

end
