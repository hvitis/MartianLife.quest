class Api::LocationsController < Api::ApiController

    def index
        @locations = Location.all
    end

end