class AddKeyTimeTempoToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :key_signature, :string
    add_column :songs, :time_signature, :string
    add_column :songs, :tempo, :string
  end
end
