class AddWinningAccommodationToBoards < ActiveRecord::Migration[5.2]
  def change
    add_reference :boards, :winning_accommodation, foreign_key: {to_table: :accommodations}
  end
end
