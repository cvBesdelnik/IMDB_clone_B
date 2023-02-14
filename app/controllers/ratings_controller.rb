class RatingsController < ApplicationController
  def new
    @rating = Rating.new
  end


  def create
    @rating = Rating.create(rating_params)
    redirect_back(fallback_location: root_path)
    
    p ("!!!!!!!!!!" + params.to_s)
  end

  private
  def rating_params
    params.require(:user_rating).permit(:rating, :movie_id)
  end
end


