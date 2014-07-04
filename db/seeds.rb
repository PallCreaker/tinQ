# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
# Category.delete_all
# Brand.delete_all

FactoryGirl.create_list(:user, 5)
FactoryGirl.create_list(:post, 10)
# FactoryGirl.create_list(:lesson, 100)