json.extract! movie, :id, :movie_title, :text, :rating, :category_id, :created_at, :updated_at
json.url movie_url(movie, format: :json)
