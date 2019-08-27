class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :destination
      t.date :start_date
      t.date :end_date
      t.boolean :winning, null: false, default: false

      t.timestamps
    end
  end
end
