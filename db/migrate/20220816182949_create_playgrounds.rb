class CreatePlaygrounds < ActiveRecord::Migration[6.1]
  def change
    create_table :playgrounds do |t|
      t.string :name, null: false
      t.text :image, null: false

      t.timestamps
    end
  end
end
