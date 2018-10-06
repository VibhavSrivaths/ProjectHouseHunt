class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.references :re_company, foreign_key: true
      t.references :user, foreign_key: true
      t.string :location
      t.string :area
      t.string :style
      t.integer :price
      t.integer :floors
      t.string :owner
      t.string :phone
      t.string :email
      t.timestamps
    end
  end
end
