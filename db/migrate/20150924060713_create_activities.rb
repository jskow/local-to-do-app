class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :cost
      t.string :gender
      t.string :group_size
      t.string :type1
      t.string :type2
      t.string :age

      t.timestamps null: false
    end
  end
end
