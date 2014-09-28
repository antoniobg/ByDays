class BookingsController < ApplicationController
  before_action :set_room, only: [:new, :create]
  before_action :set_booking, only: [:show, :destroy]

  def index
    @bookings = Booking.where(customer_email: params[:customer_email])
    @bookings = @bookings.order(:start_date) unless @bookings.empty?
  end

  def new
    start_date = DateTime.strptime(params[:dates][:start_date], "%Y-%m-%dT%H:%M:%S")
    end_date = DateTime.strptime(params[:dates][:end_date], "%Y-%m-%dT%H:%M:%S")
    @booking = Booking.new(
      start_date:  start_date,
      end_date:    end_date,
      total_price: @room.room_type.price * (end_date - start_date).to_i
    )
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.room = @room
    if @room.is_available?(@booking.start_date, @booking.end_date) and 
      @booking.save
      flash[:success] = "You have booked the room!"
      redirect_to @booking
    else
      render 'new'
    end
  end

  def show
  end


  def destroy
    @booking.destroy
    flash[:success] = "Your booking has been cancelled successfully"
    redirect_to root_path
  end

  private
    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :customer_email, :customer_name, :total_price, :room_id)
    end

    def set_room
      @room = Room.find(params[:room_id])      
    end

    def set_booking
      @booking = Booking.find(params[:id])      
    end
end
