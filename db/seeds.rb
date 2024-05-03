require 'rest-client'

Movie.destroy_all

base_url = 'https://tmdb.lewagon.com/movie/top_rated'

response = RestClient.get(base_url)
response_data = JSON.parse(response.body)
@movies = response_data['results']

@movies.each do |movie_data|
  p movie_data
  movie = Movie.new(
    title: movie_data["original_title"],
    overview: movie_data["overview"],
    poster_url: movie_data["poster_path"],
    rating: movie_data["vote_average"]
  )
  movie.save!
end
