class AddWinningTimeframeToBoards < ActiveRecord::Migration[5.2]
  def change
    add_reference :boards, :winning_timeframe, foreign_key: {to_table: :timeframes}
  end
end
