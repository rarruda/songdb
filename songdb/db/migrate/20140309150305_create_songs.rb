class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :subtitle
      t.string :author
      t.string :composer
      t.string :translator
      t.string :copyright
      t.string :note

      t.timestamps
    end
  end
end
