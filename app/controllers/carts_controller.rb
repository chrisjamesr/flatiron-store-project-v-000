class CartsController < ApplicationController
helper_method :current_cart

  def index
    @carts = Cart.where(:user => current_user)
  end

  def show
    @cart = Cart.find(params[:id]) || current_cart
  end

  def update
    @cart = Cart    
  end



 
end
