class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  # GET /movies or /movies.json
  def index
     @movies = Movie.joins(:category)
        .select(:id, :movie_title, :text, :rating, :category_name)
        .paginate(page: params[:page], per_page: 4)
     @categories = Category.all   
    
    # also work
    # @movies = Movie.joins(:category).select('movies.movie_title, movies.text, movies.rating, categories.category_name')
  end

  # GET /movies/1 or /movies/1.json
  def show
    @movie = Movie.joins(:category).select(:id, :movie_title, :text, :rating, :category_name).find(params[:id])
 
    @average_rating = Rating.where(movie_id: params[:id]).average(:rating)
    @average_rating == nil ? @average_rating = "No one voted for rating" : @average_rating.round(2)
    
   
  end

  # GET /movies/new
  def new
     @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:id, :movie_title, :text, :rating, :category_id)
    end
end
