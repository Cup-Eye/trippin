class CreateTransportations < ActiveRecord::Migration[5.2]
  def change
    create_table :transportations do |t|
      t.references :board, foreign_key: true
      t.string :route_number
      t.string :booking_number
      t.references :user, foreign_key: true
      t.datetime :departure_time
      t.datetime :arrival_time
      t.string :departure_location
      t.string :arrival_location
      t.string :kind

      t.timestamps
    end
  end
end
