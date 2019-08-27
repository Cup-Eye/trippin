class CreateAccommodations < ActiveRecord::Migration[5.2]
  def change
    create_table :accommodations do |t|
      t.references :board, foreign_key: true
      t.references :user, foreign_key: true
      t.string :url
      t.string :name
      t.string :address
      t.integer :price
      t.string :kind
      t.integer :rating
      t.boolean :winning, null: false, default: false

      t.timestamps
    end
  end
end
