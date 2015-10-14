class AddActidToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :activity_id, :integer
  end
end
