class CreateVerses < ActiveRecord::Migration
  def change
    create_table :verses do |t|
      t.integer :song_id
      t.integer :order
      t.integer :verse_type_id
      t.string :note
      t.text :content

      t.timestamps
    end
  end
end
