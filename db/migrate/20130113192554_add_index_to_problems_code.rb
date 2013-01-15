class AddIndexToProblemsCode < ActiveRecord::Migration
  def change
    add_index :problems, :code
  end
end
