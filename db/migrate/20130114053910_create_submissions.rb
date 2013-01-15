class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.text :source
      t.integer :problem_id
      t.integer :user_id
      t.integer :language

      t.timestamps
    end
  end
end
