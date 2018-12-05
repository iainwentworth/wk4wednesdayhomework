require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/pizza_order.rb')
require_relative('./models/customer.rb')
also_reload('./models/*')

# INDEX
get '/pizzas' do
  @orders = PizzaOrder.all()
  erb(:index)
end

# NEW
get '/pizzas/new' do
  @customers = Customer.all()
  erb(:new)
end

# SHOW
get '/pizzas/:id' do
  @order = PizzaOrder.find(params[:id].to_i())
  erb(:show)
end

# CREATE
post '/pizzas' do
  @order = PizzaOrder.new(params)
  @order.save()
  # redirect('/pizzas')
  erb(:create)
end

# EDIT
get '/pizzas/:id/edit' do
  @order= PizzaOrder.find(params[:id])
  @customers = Customer.all()
  @toppings = ["Pepperoni", "Calzone", "Hawaiin"]
  erb(:edit)
end

# UPDATE
post '/pizzas/:id' do
  @order = PizzaOrder.new(params)
  @order.update()
  redirect("/pizzas/#{params[:id]}")
end

# DESTROY
post '/pizzas/:id/delete' do
  order = PizzaOrder.find(params[:id])
  order.delete()
  redirect('/pizzas')
end
