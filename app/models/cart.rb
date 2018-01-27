class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, :through => :line_items
  belongs_to :user

  def add_item(item_id)
    # if Item.find(item_id).inventory > 0
    # if !self.status
      if line_item = self.line_items.find_by(:item_id => item_id) 
        line_item.quantity += 1
      else
        line_item = self.line_items.build(:item => Item.find(item_id))
      end       
      line_item
    # end
  end

  def total
    total = 0
    self.line_items.each do |line_item|
      total += line_item.quantity * line_item.item.price
    end
    total      
  end

  def checkout
    subtract_inventory
    self.update(:status => "submitted")
  end

  def subtract_inventory
    self.line_items.each do |line_item|
      item = Item.find(line_item.item.id)
      item.update(inventory: (item.inventory - line_item.quantity))
    end
  end

end  #  End of Class