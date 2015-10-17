class AddCostToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :cost, :integer
    add_column :locations, :gender, :string
    add_column :locations, :group_size, :integer
    add_column :locations, :type1, :string
    add_column :locations, :type2, :string
    add_column :locations, :age, :integer
  end
end
