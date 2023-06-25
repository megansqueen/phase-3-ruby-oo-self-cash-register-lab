require 'pry'

class CashRegister
    attr_accessor :total, :discount, :title, :price, :items, :quantity_cost

    def initialize(discount = 0, total = 0)
        @discount = discount
        @total = total
        @items = []
    end

    def add_item(title, price, quantity=1)
        self.quantity_cost = price*quantity
        self.total += quantity_cost
        quantity.times do 
            self.items << title
        end
    end

    def apply_discount
        if discount > 0 
            discount_float = (self.discount / 100.00).to_f
            self.total = self.total - (discount_float * self.total).to_i
            return "After the discount, the total comes to $#{self.total}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.quantity_cost
    end
end

# CashRegister
#   .new
#     takes one optional argument, an employee discount, on initialization
#     sets an instance variable @total on initialization to zero
#   #total
#     returns the current total
#   #add_item
#     accepts a title and a price and increases the total (FAILED - 1)
#     also accepts an optional quantity (FAILED - 2)
#     doesn't forget about the previous total (FAILED - 3)
#   #apply_discount
#     when the cash register was initialized with an employee discount
#       applies the discount to the total price (FAILED - 4)
#       returns success message with updated total (FAILED - 5)
#       reduces the total (FAILED - 6)
#     when the cash register was not initialized with an employee discount
#       returns a string error message that there is no discount to apply (FAILED - 7)
#   #items
#     when called with two arguments
#       returns an array containing all items that have been added (FAILED - 8)
#     when called with three arguments
#       returns an array containing all items that have been added, including multiples (FAILED - 9)
#   #void_last_transaction
#     subtracts the last item from the total (FAILED - 10)
#     returns the total to 0.0 if all items have been removed (FAILED - 11)
