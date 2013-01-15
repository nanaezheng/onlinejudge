class AddVerdictToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :status, :integer
    add_column :submissions, :report, :text
  end
end
