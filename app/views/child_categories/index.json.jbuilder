json.array!(@child_categories) do |child_category|
  json.extract! child_category, :id, :parent_category_id
  json.url child_category_url(child_category, format: :json)
end
