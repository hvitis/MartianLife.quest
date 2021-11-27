require "test_helper"

describe SurfacesController do
  it "must get explore" do
    get surfaces_explore_url
    must_respond_with :success
  end

end
