class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'Review was successfully updated.'
    else
      render :new
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_review
  #   @review = Review.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
