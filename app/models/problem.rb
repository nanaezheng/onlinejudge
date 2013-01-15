class Problem < ActiveRecord::Base
  attr_accessible :code, :memory_limit, :name, :task, :test_count, :time_limit, :submissions

  validates :code, :presence => true, :uniqueness => true
  validates :test_count, :presence => true
  validates :time_limit, :presence => true
  validates :memory_limit, :presence => true

  has_many :submissions

  def to_s
    "#{id}. #{name}"
  end

  ATTRS = [:code, :name, :task, :test_count, :time_limit, :memory_limit]

  def build_from_json!(json)
    data = JSON.parse(json).symbolize_keys!
    ATTRS.each do |attr|
      self[attr] = data[attr]
    end
    save
  end
end
