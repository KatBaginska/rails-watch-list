class ListsController < ApplicationController
  def index
    base_url = 'https://tmdb.lewagon.com/movie/top_rated'
    response = RestClient.get(base_url)
    response_data = JSON.parse(response.body)

    @movies = response_data['results'].map do |movie_data|
      Movie.new(
        title: movie_data["original_title"],
        overview: movie_data["overview"],
        poster_url: movie_data["poster_path"],
        rating: movie_data["vote_average"]
      )
    end
  end
end
