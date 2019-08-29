class Removeadminfromtrips < ActiveRecord::Migration[5.2]
  def change
    remove_column :trips, :admin_id
  end
end
