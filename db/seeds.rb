# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Activity.create!(search_type:  "bowling_alley",
               cost: 2,
               gender: "male",
               group_size: 2,
               type1: 0,
	       type2: 0,
               age: 2,
               image_path: "bowling.jpg",
               name: "Bowling")
Activity.create!(search_type:  "restaurant",
               cost: 2,
               gender: "male",
               group_size: 2,
               type1: 0,
	       type2: 0,
               age: 2,
               name: "Restaurant")
Activity.create!(search_type:  "park",
               cost: 2,
               gender: "male",
               group_size: 2,
               type1: 0,
	       type2: 0,
               age: 2)
Activity.create!(search_type:  "bowling_alley",
               cost: 1,
               gender: "male",
               group_size: 1,
               type1: 0,
	       type2: 0,
               age: 1)
Activity.create!(search_type:  "restaurant",
               cost: 1,
               gender: "male",
               group_size: 1,
               type1: 0,
	       type2: 0,
               age: 1)
Activity.create!(search_type:  "park",
               cost: 2,
               gender: "male",
               group_size: 2,
               type1: 0,
	       type2: 0,
               age: 2)

