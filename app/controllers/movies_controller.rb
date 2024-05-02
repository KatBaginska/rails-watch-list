class MoviesController < ApplicationController
  base_url = 'https://tmdb.lewagon.com/movie/top_rated'

  def top_rated_movies
    response = self.class.get('')
    if response.success?
      @movies = JSON.parse(response.body)['results']
      render json: @movies
    else
      render json: { error: "Failed to fetch top rated movies: #{response.code} - #{response.message}" }, status: :unprocessable_entity
    end
  end

  def index
  end
end
