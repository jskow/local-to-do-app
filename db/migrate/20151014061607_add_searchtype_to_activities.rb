class AddSearchtypeToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :image_alt, :string
    add_column :activities, :search_type, :string
  end
end
