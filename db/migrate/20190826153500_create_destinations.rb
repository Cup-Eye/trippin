class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.references :board, foreign_key: true
      t.string :name
      t.references :user, foreign_key: true
      t.text :description
      t.boolean :winning, null: false, default: false

      t.timestamps
    end
  end
end
