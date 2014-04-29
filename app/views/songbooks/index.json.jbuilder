json.array!(@songbooks) do |songbook|
  json.extract! songbook, :id, :name
  json.url songbook_url(songbook, format: :json)
end
