class AddWinningDestinationToBoards < ActiveRecord::Migration[5.2]
  def change
    add_reference :boards, :winning_destination, foreign_key: {to_table: :destinations}
  end
end
