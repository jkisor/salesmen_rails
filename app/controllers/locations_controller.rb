class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new location_params
    if @location.save
      flash[:notice] = 'Location successfully created.'
      redirect_to @location
    else
      render :new
    end
  end

  def show
    @location = Location.find params[:id]
  end

  def edit
    @location = Location.find params[:id]
  end

  def update
    @location = Location.find params[:id]
    if @location.update_attributes location_params
      flash[:notice] = 'Location successfully updated.'
      redirect_to @location
    else
      render :edit
    end
  end

  def destroy
    Location.find(params[:id]).destroy
    flash[:notice] = 'Location successfully deleted.'
    redirect_to locations_path
  end

  private

  def location_params
    params.require(:location).permit(:name, :address_line_1, :address_line_2, :city, :state, :zip)#, :sales_rep_id)
  end
end
