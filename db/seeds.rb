10.times do 
  Item.create(
    title: Faker::Commerce.product_name, 
    inventory: Faker::Number.number(2), 
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

# User.create(name: 'Alex', email:'alex@home.com')
10.times do 
  User.create(
  :name => Faker::Name.name,    
  :password => Devise.friendly_token.first(8),
  :email => Faker::Internet.email 
  ) 
end

User.all do |user|
  Cart.create(:user => user) do |cart|
    cart.line_items.build(:item => Item.first, :quantity =>1)
  end
end
