class CreateParks < ActiveRecord::Migration[6.1]
  def change
    create_table :parks do |t|
      t.string :name, null: false
      t.text :Introduction, null: false
      t.string :address, null: false
      t.string :prefecture
      t.float :latitude
      t.float :longitude
      t.text :main_image, null: false
      t.text :sub_image1
      t.text :sub_image2
      t.text :sub_image3
      t.text :sub_image4
      t.text :sub_image5
      t.text :sub_image6
      t.text :sub_image7
      t.text :sub_image8
      t.text :sub_image9
      t.text :sub_image10
      t.text :sub_image11

      t.timestamps
    end
  end
end
