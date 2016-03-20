class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.text :notes
      t.integer :calendar_id

      t.timestamps null: false
    end
  end
end
