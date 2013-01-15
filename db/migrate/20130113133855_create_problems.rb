class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :name
      t.string :code
      t.integer :test_count
      t.integer :time_limit
      t.integer :memory_limit
      t.text :task

      t.timestamps
    end
  end
end
