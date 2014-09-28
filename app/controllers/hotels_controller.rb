class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  def index
    @hotels = Hotel.all
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      flash[:success] = "Hotel created successfully"
      redirect_to hotels_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @hotel.update_attributes(hotel_params)
      flash[:success] = "Hotel updated successfully"
      redirect_to hotel_path(@hotel)
    else
      render 'edit'
    end
  end

  def destroy
    @hotel.destroy
    flash[:success] = "Hotel '#{@hotel}' has been deleted successfully"
    redirect_to root_path
  end

  private
    def hotel_params
      params.require(:hotel).permit(:name, :description, :picture, :address)
    end

    def set_hotel
      @hotel = Hotel.find(params[:id])
    end
end
