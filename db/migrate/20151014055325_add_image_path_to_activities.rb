class AddImagePathToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :image_path, :string
  end
end
