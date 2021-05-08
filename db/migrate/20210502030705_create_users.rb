class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :pass
      t.string :mail
      t.string :image
      t.string :text

      t.timestamps
    end
  end
end
