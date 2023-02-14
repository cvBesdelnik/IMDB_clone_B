class ReportsController < ApplicationController
  def filtr_by_category
    @movies = Movie.joins(:category)
    .select(:id, :movie_title, :text, :rating, :category_name)
    .where(category_id: params[:category][:id])
  
    p ("!!!!!!!!!!!!!!!!!!!" + params.to_s)  
  end

 
end
