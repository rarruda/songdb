class CreateVerseTypes < ActiveRecord::Migration
  def change
    create_table :verse_types do |t|
      t.string :name
      t.integer :order
      t.string :shortcut_key

      t.timestamps
    end
  end
end
