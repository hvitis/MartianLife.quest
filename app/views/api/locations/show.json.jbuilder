json.location do
  json.id @location.id
  json.name @location.name
  json.band t(@location.band, scope: 'bands')
end
