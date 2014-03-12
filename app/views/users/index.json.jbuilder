json.array!(@users) do |user|
  json.extract! user, :id, :recipe_id, :username
  json.url user_url(user, format: :json)
end
