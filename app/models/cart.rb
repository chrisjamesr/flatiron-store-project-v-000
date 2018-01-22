class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, :through => :line_items
  belongs_to :user

  def add_item(item)
    self.line_items.first_or_create(item: item)
    
  end

  def total
     
  end


end
