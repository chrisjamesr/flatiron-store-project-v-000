class LineItemsController < ApplicationController

  def create
    current_user.create_current_cart unless current_cart
    line_item = current_cart.add_item(params[:item_id])
    if line_item.save
      redirect_to cart_path(current_cart),  {:notice => "Added to Cart"}
    else 
      redirect_to store_path, {:notice => "Not Added to Cart"}   
    end
  end

end

