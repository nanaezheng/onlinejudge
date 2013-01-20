class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :name
      t.string :code
      t.integer :time_limit
      t.text :task

      t.timestamps
    end
  end
end
