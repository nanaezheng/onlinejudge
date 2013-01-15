class Submission < ActiveRecord::Base
  attr_accessible :problem_id, :source, :user_id, :problem, :user, :status, :report

  belongs_to :user
  belongs_to :problem

  validates :problem_id, :presence => true
  validates :user_id, :presence => true

  def verdict
    %w(Pening Running Accepted CompileError WrongAnswer RuntimeError TimeLimitExceed MemoryLimitExceed)[self.status]
  end

  def language
    "Default"
  end

  ATTRS = [:status, :report]

  def build_from_json!(json)
    data = JSON.parse(json).symbolize_keys!
    ATTRS.each do |attr|
      self[attr] = data[attr] if data.has_key?(attr)
    end
    save
  end
end
