class CreateRentals < ActiveRecord::Migration[6.1]
  def change
    create_table :rentals do |t|
      t.string :title
      t.integer :price
      t.integer :max_user
      t.string :description
      t.string :Aria
      t.string :address
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
