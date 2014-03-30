json.array!(@verse_types) do |verse_type|
  json.extract! verse_type, :id, :name, :order, :shortcut_key
  json.url verse_type_url(verse_type, format: :json)
end
