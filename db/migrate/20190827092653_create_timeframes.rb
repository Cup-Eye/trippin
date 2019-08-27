class CreateTimeframes < ActiveRecord::Migration[5.2]
  def change
    create_table :timeframes do |t|
      t.references :board, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.references :user, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
