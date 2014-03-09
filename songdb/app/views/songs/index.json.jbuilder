json.array!(@songs) do |song|
  json.extract! song, :id, :title, :subtitle, :author, :composer, :translator, :copyright, :note
  json.url song_url(song, format: :json)
end
