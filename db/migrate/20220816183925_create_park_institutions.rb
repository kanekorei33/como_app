class CreateParkInstitutions < ActiveRecord::Migration[6.1]
  def change
    create_table :park_institutions do |t|
      t.references :park, null: false, foreign_key: true
      t.references :institution, null: false, foreign_key: true

      t.timestamps
    end
  end
end
