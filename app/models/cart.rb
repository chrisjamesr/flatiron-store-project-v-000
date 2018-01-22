class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, :through => :line_items
  belongs_to :user

  def add_item(item_id)
    if existing_line_item = self.line_items.find_by(:item_id => item_id)
      # existing_line_item.assign_attributes(:quantity => existing_line_item.quantity += 1)
      existing_line_item.quantity += 1
      existing_line_item
      # line_item = self.line_items.find_by(:item => existing_line_item.item)
      # line_item.update(:quantity => self.quantity += 1)
      # binding.pry
    else
      line_item = self.line_items.build(:item => Item.find(item_id))
    end       
  end

  def total
     
  end


end

# def add_item(item_id)
#     line_item = self.line_items.build(:item => Item.find(item_id))
#     if self.items.include?(line_item.item)
#       self.line_items.find_by(:item => line_item.item).quantity += line_item.quantity
#     else
#       save
#     end       
#   end
# existing_line_item.assign_attributes({ :quantity => 1})