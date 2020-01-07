class CashRegister
  attr_accessor :total, :employee_discount, :items

  def initialize(employee_discount = nil)
    @total = 0
    @employee_discount = employee_discount
    @items = []
  end
  
  def discount
    self.employee_discount
  end
  
  def total
    return @total
  end
  
  def add_item(item,price,quantity= 1)
    @items << [item, price, quantity]
    @total += price * quantity
  end
  
  def apply_discount
    @total *= 0.8
    if employee_discount
      "After the discount, the total comes to $#{@total.round}."
    else
      "There is no discount to apply."
    end
  end
  
  def items
    results = []
    @items.each_with_index{ |element, index|
      @items[index][2].times{
        results << @items[index][0]
      }
    }
    return results
  end
  
  def void_last_transaction
    @total -= @items[-1][1] * @items[-1][2]  
    @items.pop
    if @items.length == 0
      return 0.0
    end
  end
  
end

 