class RemoveNotesFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :notes
  end
end
