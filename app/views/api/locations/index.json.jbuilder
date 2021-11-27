json.locations @locations.each do |location|
  json.id location.id
  json.created_at l(location.created_at, format: :default)
  json.x location.x
  json.y location.y
end
