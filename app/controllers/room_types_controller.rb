class RoomTypesController < ApplicationController
  before_action :set_hotel, except: [:update, :destroy]
  before_action :set_room_type, except: [:new, :create]

  def new
    @room_type = RoomType.new
  end

  def create
    @room_type = RoomType.new(room_type_params)
    @room_type.hotel = @hotel
    if @room_type.save
      params[:rooms][:number_of_rooms].to_i.times do
        Room.create(room_type_id: @room_type.id)
      end
      flash[:success] = "Room Type #{@room_type} created for hotel #{@hotel}"
      redirect_to @hotel
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @room_type.update_attributes(room_type_params)
      params[:rooms][:number_of_rooms].to_i.times do
        Room.create(room_type_id: @room_type.id)
      end
      flash[:success] = "Hotel updated successfully"
      redirect_to hotel_path(@room_type.hotel)
    else
      render 'edit'
    end
  end

  def destroy
    @room_type.destroy
    flash[:success] = "Room Type #{@room_type} from #{@room_type.hotel} has been deleted successfully"
    redirect_to hotel_path(@room_type.hotel)
  end

  def check_availability
    start_date = DateTime.strptime(params[:booking][:start_date], "%m/%d/%Y")
    end_date = DateTime.strptime(params[:booking][:end_date], "%m/%d/%Y")

    @room = @room_type.get_first_available(start_date, end_date)
    unless @room.nil?
      flash[:success] = "room available"
      redirect_to new_room_booking_path(@room, dates: { start_date: start_date, end_date: end_date})
    else
      flash[:error] = "This type of room is not available for the specified date"
      redirect_to @hotel
    end
  end

  private

    def room_type_params
      params.require(:room_type).permit(:name, :picture, :price)
    end

    def set_hotel
      @hotel = Hotel.find(params[:hotel_id])
    end

    def set_room_type
      @room_type = RoomType.find(params[:room_type_id] || params[:id])
    end
end
