class AddSongbookRefToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :songbook_ref, :string
  end
end
