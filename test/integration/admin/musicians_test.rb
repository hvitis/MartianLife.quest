require 'test_helper'

describe "locations", :model do

  describe "#index" do
    it "returns a 401 when not signed in" do
      get api_admin_locations_path

      assert_equal 401, last_response.status
    end

    it "returns all locations when signed in" do
      sign_in users(:admin)
      get api_admin_locations_path

      assert_equal 3, json_response['locations'].length
      assert_equal "baz", json_response['locations'][0]['name']
    end
  end

  describe "#new" do
    before do
      sign_in users(:admin)
    end

    it "returns an initialized location" do
      get new_api_admin_location_path

      assert_equal 200, last_response.status
      assert_nil json_response['location']['name']
      assert_nil json_response['location']['band']
    end
  end

  describe "#create" do
    before do
      sign_in users(:admin)
    end

    it "returns a location when successfuly created" do
      post api_admin_locations_path, {
        "location" => {
          "name"=>"new test location",
          "band"=>"acdc"
        }
      }

      assert_equal 200, last_response.status
      assert_equal "new test location", json_response['location']['name']
    end
  end

  describe "#edit" do
    it "returns a location when signed in" do
      sign_in users(:admin)
      get edit_api_admin_location_path(locations(:one).id)

      assert_equal 200, last_response.status
      assert_equal "foo", json_response['location']['name']
    end
  end

  describe "#update" do
    before do
      sign_in users(:admin)
    end

    it "returns a location when successfuly created" do
      put api_admin_location_path(locations(:one).id), {
        "location" => {
          "name"=>"edited test location",
          "band"=>"beatles"
        }
      }

      assert_equal 200, last_response.status
      assert_equal "edited test location", json_response['location']['name']
    end

    it "returns validation errors when location is not valid" do
      put api_admin_location_path(locations(:one).id), {
        "location" => {
          "name"=>"",
          "band"=>"beatles"
        }
      }
      out = {"success"=>false, "errors"=>{"name"=>["can't be blank"]}}

      assert_equal 422, last_response.status
      assert_equal out, json_response
    end
  end

  describe "#destroy" do
    it "removes a location" do
      assert_difference "location.count", -1 do
        sign_in users(:admin)
        delete api_admin_location_path(locations(:one).id)

        assert_equal 204, last_response.status
      end
    end
  end
end
