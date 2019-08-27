class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.references :trip, foreign_key: true
      t.string :type
      t.string :title
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
