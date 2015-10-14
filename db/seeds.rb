# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Activity.create!(search_type:  "bowling_alley",
               cost: "mid",
               gender: "male",
               group_size: "mid",
               type1: 0,
	       type2: 0,
               age: "mid",
               image_path: "bowling.jpg",
               name: "Bowling")
Activity.create!(search_type:  "restaurant",
               cost: "mid",
               gender: "male",
               group_size: "mid",
               type1: 0,
	       type2: 0,
               age: "mid",
               name: "Restaurant")
Activity.create!(search_type:  "park",
               cost: "mid",
               gender: "male",
               group_size: "mid",
               type1: 0,
	       type2: 0,
               age: "mid")
Activity.create!(search_type:  "bowling_alley",
               cost: "mid",
               gender: "male",
               group_size: "mid",
               type1: 0,
	       type2: 0,
               age: "mid")
Activity.create!(search_type:  "restaurant",
               cost: "mid",
               gender: "male",
               group_size: "mid",
               type1: 0,
	       type2: 0,
               age: "mid")
Activity.create!(search_type:  "park",
               cost: "mid",
               gender: "male",
               group_size: "mid",
               type1: 0,
	       type2: 0,
               age: "mid")

