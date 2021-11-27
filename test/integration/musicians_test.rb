require 'test_helper'

describe "locations", :model do

  describe "#index" do
    it "returns all locations" do
      get api_locations_path
      out = {
        "locations"=>[
          {"id"=>113629430, "created_at"=>"December 18 2017 20:43", "name"=>"baz", "band"=>"The Rolling Stones"},
          {"id"=>298486374, "created_at"=>"December 18 2017 20:43", "name"=>"bar", "band"=>"The Rolling Stones"},
          {"id"=>980190962, "created_at"=>"December 18 2017 20:43", "name"=>"foo", "band"=>"The Beatles"}
        ]
      }

      assert_equal 3, json_response['locations'].length
      assert_equal "baz", json_response['locations'][0]['name']
    end
  end

  describe "#show" do
    it "returns a location" do
      get api_location_path(locations(:one).id)
      out = {
        "location"=> {
          "id"=>298486374,
          "created_at"=>"December 18 2017 20:43",
          "name"=>"bar",
          "band"=>"The Rolling Stones"
        }
      }

      assert_equal 200, last_response.status
      assert_equal "foo", json_response['location']['name']
    end
  end

end
