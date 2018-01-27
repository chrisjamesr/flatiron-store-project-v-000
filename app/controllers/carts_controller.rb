class CartsController < ApplicationController


  def show
    @cart = current_cart || Cart.find(params[:id]) 
  end

  def checkout
    current_cart.checkout
    redirect_to cart_path(current_cart), {:notice => "Your order has been placed"}
    current_user.remove_current_cart
    # set current_cart to nil
  end

end

 