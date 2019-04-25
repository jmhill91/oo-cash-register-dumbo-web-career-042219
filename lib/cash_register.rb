class CashRegister
  attr_accessor :total, :discount, :transaction
  def initialize(employee_discount=0)
    @total=0
    @discount=employee_discount
    @cart=[]
  end
  def add_item(title,price,quantity=1)
    @total = self.total + (price*quantity)
    quantity.times do
      @cart << title
    end
    self.transaction = (price * quantity)
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total -= self.total* self.discount / (100.00).to_f
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def items
    @cart
  end

  def void_last_transaction
    self.total -= self.transaction
  end
end
