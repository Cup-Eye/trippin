class AddAdminToTrip < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :admin_id, :integer, defaults: 0
  end
end
