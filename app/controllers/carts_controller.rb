class CartsController < ApplicationController
helper_method :current_cart

  def index
    @carts = Cart.where(:user => current_user)
  end

  def show
    @cart = current_cart || Cart.find(params[:id]) 
  end

  def checkout
    current_cart.checkout
    redirect_to cart_path(current_cart), {:notice => "Your order has been placed"}
  
    # set current_cart to nil
  end

end

 