class RenameOrderToPositionInVerseType < ActiveRecord::Migration
  def change
    change_table :verse_types do |t|
      t.rename :order, :position
    end
  end
end
