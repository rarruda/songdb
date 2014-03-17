class RenameOrderToPositionInVerses < ActiveRecord::Migration
  def change
    change_table :verses do |t|
      t.rename :order, :position
    end
  end
end
