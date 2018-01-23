class LineItemsController < ApplicationController

  def create
    raise params.inspect
    current_cart.add_item(params[:item_id])
  end

end
