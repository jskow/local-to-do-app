class AddIndexToActivities < ActiveRecord::Migration
  def change
    add_index :activities, unique: true
  end
end
