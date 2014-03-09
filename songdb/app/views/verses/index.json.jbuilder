json.array!(@verses) do |verse|
  json.extract! verse, :id, :song_id, :order, :verse_type_id, :note, :content
  json.url verse_url(verse, format: :json)
end
