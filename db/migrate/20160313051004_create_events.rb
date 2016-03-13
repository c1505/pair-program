class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :host_id
      t.integer :guest_id
      t.string :title
      t.datetime :earliest_start
      t.datetime :latest_start
      t.text :notes
      t.string :desired_style

      t.timestamps null: false
    end
  end
end
