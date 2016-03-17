class AddFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :estimated_duration, :integer
    add_column :events, :estimated_difficulty, :integer
    add_column :events, :repo_link, :string
  end
end
