json.locations @locations.each do |location|
  json.id location.id
  json.created_at l(location.created_at, format: :default)
  json.name location.name
  json.band t(location.band, scope: 'bands')
end

json.bands location.bands.each do |band, key|
  json.key key
  json.name t(band, scope: 'bands')
end

json.partial! partial: '/api/admin/shared/pagination', locals: {
  kind: @locations,
  callback: 'locationStore/index'
}
