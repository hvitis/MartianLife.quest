json.location do
  json.id @location.id
  json.name @location.name
  json.band @location.band
  json.bands location.bands.each do |name, _|
    json.key name
    json.name t(name, scope: 'bands')
  end
end
