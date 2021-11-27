class Location < ApplicationRecord
  paginates_per 100

  validates_presence_of :x, :y

  # enum band: [:rolling_stones, :beatles, :acdc]
end
