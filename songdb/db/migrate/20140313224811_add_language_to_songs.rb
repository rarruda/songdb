class AddLanguageToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :language_id, :integer
  end
end
