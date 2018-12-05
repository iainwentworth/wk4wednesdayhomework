require_relative("../models/pizza_order.rb")
require_relative("../models/customer.rb")

PizzaOrder.delete_all()
Customer.delete_all()

customer1 = Customer.new(
  {
    'first_name' => 'Luke',
    'last_name' => 'Skywalker'
  }
)

customer1.save()

order1 = PizzaOrder.new(
  {
    'customer_id' => "#{customer1.id}",
    'topping' => 'Pepperoni',
    'quantity' => '2'
  }
)

order1.save()



customer2 = Customer.new(
  {
    'first_name' => 'Darth',
    'last_name' => 'Vader'
  }
)

customer2.save()

order2 = PizzaOrder.new(
  {
    'customer_id' => "#{customer2.id}",
    'topping' => 'Hawaiin',
    'quantity'=> '2'
  }
)

order2.save()
