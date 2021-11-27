class Api::Admin::locationsController < Api::Admin::AdminController
  before_action :load_location, except: [:index, :new, :create]

  def index
    @locations = location.ransack(search_params)
                         .result
                         .page(params[:page])
                         .per(params[:per_page])
  end

  def new
    @location = location.new
  end

  def edit
  end

  def create
    sleep 2 # DELETE ME: Dummy emulation of a slow network so you can see the spinner in dev. mode
    @location = location.create(location_params)

    if @location.errors.any?
      render json: {success: false, errors: @location.errors.messages}.to_json, status: 422
    else
      render template: '/api/admin/locations/edit'
    end
  end

  def update
    if @location.update(location_params)
      render template: '/api/admin/locations/edit'
    else
      render json: {success: false, errors: @location.errors.messages}.to_json, status: 422
    end
  end

  def destroy
    if @location.destroy
      head 204
    else
      render json: {success: false, errors: @location.errors.messages}.to_json, status: 422
    end
  end

  private

    def location_params
      params.require(:location).permit(
        :x,
        :y
      )
    end

    def load_location
      @location = location.find(params[:id])
    end

end
