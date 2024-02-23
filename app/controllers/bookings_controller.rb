class BookingsController < ApplicationController
  def index
    @bookings = Booking.all

    # p @bookings.book

    @bookings.each do |book|
      
    end

  end

  def show
    @booking = Booking.find(params[:id])

    @book = Book.find(@booking.book_id)
    @user = User.find(@booking.user_id)
  end

  def new
    @book = Book.find(params[:id])
    @users = User.all
    
    @booking = Booking.new
  end

  def create
    p booking_params
    @booking = Booking.new(booking_params)
    
    if @booking.save
      redirect_to @booking
    else
      render :new
    end
  end
  
  def edit
    @booking = Booking.find(params[:id])

    if !@booking.book_id.present?
      redirect_to bookings_url
    else
      @book = Book.find(@booking.book_id)
    end
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(booking_params)
      redirect_to @booking
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to bookings_path, status: :see_other
  end

  private
    def booking_params
      params.require(:booking).permit(:out_date, :due_date, :book_id, :user_id)
    end
end
