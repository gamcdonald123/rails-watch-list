100.times do
  Movie.create(title: Faker::Movie.unique.title, overview: "This movie is great")
end
