class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :cost
      t.string :gender
      t.integer :group_size
      t.string :type1
      t.string :type2
      t.integer :age

      t.timestamps null: false
    end
  end
end
