json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :production_time, :style_id, :instruction
  json.url recipe_url(recipe, format: :json)
end
