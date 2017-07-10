class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :title
      t.integer :star_rating
      t.string :breakfast
      t.text :room_desc
      t.string :price
      t.string :address
      t.string :image
      t.integer :user_id
      t.timestamps
    end
  end
end
