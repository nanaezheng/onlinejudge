class Problem < ActiveRecord::Base
  attr_accessible :code, :name, :task, :time_limit, :submissions

  validates :code, :presence => true, :uniqueness => true
  #validates :test_count, :presence => true
  #validates :time_limit, :presence => true
  validates :memory_limit, :presence => true

  has_many :submissions

  def to_s
    "#{id}. #{name}"
  end

  @@ATTRIBUTES = [:code, :name, :task, :time_limit]

  def build_from_json!(json)
    data = JSON.parse(json).symbolize_keys!
    @@ATTRIBUTES.each do |attr|
      self[attr] = data[attr] if data.has_key?(attr)
    end
    save
  end
end
