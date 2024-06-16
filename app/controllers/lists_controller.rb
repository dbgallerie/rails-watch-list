class ListsController < ApplicationController

  def index
    @movie = Movie.find(params[:id])
  end

  def show
    @movie = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to movie_path(@movie)
  end

  def update
    movie = Movie.find(params[:id])
    if movie.update(movie_params)
      redirect_to_movie_path(movie)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :rating)
  end
end
