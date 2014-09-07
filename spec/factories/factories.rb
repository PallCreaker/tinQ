# Read about factories at https://github.com/thoughtbot/factory_girl
# coding: utf-8
include ActionDispatch::TestProcess

FactoryGirl.define do
  # factory :user do
  #   sequence(:email) { |n| "test#{n}@test.com" }
  #   password "testtest"
  #   sequence(:name) { |n| "清水-#{n}さん" }
  # end

  # factory :post do
  #   category
  #   product
  #   user
  #   content 'いい感じにかわいい！！'
  #   photo { fixture_file_upload("spec/files/test.jpg", "image/jpg") }
  #   is_deleted 0
  # end

  factory :product do
    brand
    sequence(:goods_name) { |n| "マスカラ_#{n}" }
  end

  factory :parent_category do
    sequence(:name) { |n| "下地_#{n}" }
  end

  factory :brand do
    sequence(:name) { |n| "資生堂_#{n}" }
  end
end

