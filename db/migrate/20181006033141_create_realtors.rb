class CreateRealtors < ActiveRecord::Migration[5.2]
  def change
    create_table :realtors do |t|
      t.references :user, foreign_key: true
      t.references :re_company, foreign_key: true
      t.timestamps
    end
  end
end
