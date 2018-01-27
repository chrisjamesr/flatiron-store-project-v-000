class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  belongs_to :line_item
  has_many :users, :through => :line_items

  def self.available_items
    where('inventory > 0')   
  end 
end
