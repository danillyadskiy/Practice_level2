class CommentsController < ApplicationController
 
  def create
    @hotel = Hotel.find(params[:hotel_id])
    @comment = Comment.create(comment_params)
    @comment.hotel_id = @hotel.id
    @comment.user_name = current_user.name
    if @comment.save
      redirect_to hotel_path(@hotel)
    else
      redirect_to hotel_path(@hotel)
    end
  end

  def destroy
    @hotel = Hotel.find(params[:hotel_id])
    @comment = @hotel.comments.find(params[:id])
    @comment.destroy
    redirect_to hotel_path(@hotel)
  end
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
