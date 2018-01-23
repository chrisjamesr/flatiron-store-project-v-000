class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      add_reference :carts, :user, index: true
      add_foreign_key :carts, :users
    end

  end
end
