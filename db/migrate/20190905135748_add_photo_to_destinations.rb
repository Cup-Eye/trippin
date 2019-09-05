class AddPhotoToDestinations < ActiveRecord::Migration[5.2]
  def change
    add_column :destinations, :photo, :string
  end
end
