json.array!(@ratings) do |rating|
  json.extract! rating, :id, :recipe_id, :user_id, :score
  json.url rating_url(rating, format: :json)
end
