class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_review, only: [:show, :destroy]
  
  def index
 
  end
  
  def show
  end
  
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    
    if @review.save
      flash[:success] = "Your review for #{@review.book.title} has been successfully added."
      redirect_to book_path(@review.book)
    else
      redirect_to book_path(@review.book)
    end
  end
  
  def destroy
    @review.delete
    flash[:success] = "Review deleted successfully."
    redirect_to book_path
  end
  
  private
  
  def find_review
    @review = Review.find(params[:id])
  end
  
  def review_params
    params.require(:review).permit(:book_id, :rating, :content)
  end
  
end