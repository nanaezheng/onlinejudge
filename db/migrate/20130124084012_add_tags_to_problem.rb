class AddTagsToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :tags_string, :string
  end
end
