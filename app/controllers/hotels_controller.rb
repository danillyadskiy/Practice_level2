class HotelsController < ApplicationController
  def index
  	@hotel = Hotel.top5
  end
 
  def show
  	@hotel= Hotel.find(params[:id])     
  end

  def new
    @hotel = Hotel.new
  end

  def list_of_hotels
    @hotel = Hotel.all
  end

  def create
    @hotel = Hotel.new(hotel_params)
    @hotel.user_id = current_user.id
    if @hotel.save
      @hotel.votes.create
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end
 
  def update
    @hotel = Hotel.find(params[:id])
 
    if @hotel.update(hotel_params)
      redirect_to current_user 
    else
      render 'edit'
    end
  end
 
  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
 
    redirect_to current_user 
  end
 
  private
    def hotel_params
      params.require(:hotel).permit(:title, :star_rating, :breakfast, :room_desc, :price, :address, :image)
    end
end
