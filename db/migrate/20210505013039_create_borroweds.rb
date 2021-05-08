class CreateBorroweds < ActiveRecord::Migration[6.1]
  def change
    create_table :borroweds do |t|
      t.date :lodgment_start
      t.date :lodgment_end
      t.integer :property_id
      t.integer :user
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
  end
end
