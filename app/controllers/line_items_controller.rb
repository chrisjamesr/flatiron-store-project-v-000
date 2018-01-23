class LineItemsController < ApplicationController

  def create
    current_cart.add_item(params[:item_id])
  end
end
