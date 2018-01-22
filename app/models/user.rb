class User < ActiveRecord::Base
  has_many :carts
  belongs_to :current_cart, :class_name => 'Cart', :foreign_key => 'current_cart_id'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def create_current_cart
    new_cart = carts.create
    current_cart_id = new_cart.id       
    save
  end

  
end
