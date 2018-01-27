class User < ActiveRecord::Base
  has_many :carts
  belongs_to :current_cart, :class_name => 'Cart', :foreign_key => 'current_cart_id'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def create_current_cart
    new_cart = carts.create
    self.current_cart = new_cart
    save
  end

  def orders
    self.carts.where(:status => 'submitted')
  end

  def remove_current_cart
    self.current_cart = nil
    save
  end


  
end
