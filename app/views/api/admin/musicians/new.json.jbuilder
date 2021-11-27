json.location do
  json.name @location.name
  json.bands location.bands.each do |name, _|
    json.key name
    json.name t(name, scope: 'bands')
  end
end
