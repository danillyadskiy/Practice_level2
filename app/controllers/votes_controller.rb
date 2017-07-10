class VotesController < ApplicationController
	def create
    	@hotel = Hotel.find(params[:hotel_id])
    	@vote = Vote.create
    	@vote.hotel_id = @hotel.id
    	@vote.user_id = current_user.id
   	 	if @vote.save
      		redirect_to hotel_path(@hotel)
    	else
      redirect_to hotel_path(@hotel)
    end
  end
end
