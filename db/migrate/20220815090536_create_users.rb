class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :nickname
      t.string :email
      t.string :password_digest
      t.text :image
      t.string :profile
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
