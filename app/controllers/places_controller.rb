class PlacesController < ApplicationController
   before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @places = Place.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
  end

  def about
  end

  def edit
    if @place.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end
  end

  def new
    @place = Place.new
  end

  def create
     current_user.places.create(place_params)
     redirect_to root_path
  end

  def destroy
      @place = Place.find(params[:id])
      if @place.user != current_user
        return render text: 'Not Allowed', status: :forbidden
       end

      @place.destroy
      redirect_to root_path
  end

  def show
      @place = Place.find(params[:id])
  end

  def update
      @place = Place.find(params[:id])
      if @place.user != current_user
        return render text: 'Not Allowed', status: :forbidden
      end
      @place.update_attributes(place_params)
      redirect_to root_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end

end
