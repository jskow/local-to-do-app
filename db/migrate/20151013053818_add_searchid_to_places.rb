class AddSearchidToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :search_id, :integer
  end
end
