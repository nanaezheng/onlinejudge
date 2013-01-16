class Submission < ActiveRecord::Base
  attr_accessible :problem_id, :source, :user_id, :problem, :user, :status, :report

  belongs_to :user
  belongs_to :problem

  validates :problem_id, :presence => true
  validates :user_id, :presence => true

  def verdict
    ["Pending",
     "Running",
     "Accepted",
     "Compile Error",
     "Wrong Answer", 
     "Runtime Error",
     "Time Limit Exceed",
     "Memory Limit Exceed"][self.status]
  end

  def verdict=(v)
    self.status = %w(WT RUN OK CE WA RE TLE MLE).index(v)
  end

  def build_from_json!(json)
    data = JSON.parse(json).symbolize_keys!
    self.verdict = data[:verdict]
    self.report = data[:report]
    save
  end

  before_save :set_default 

  private

  def set_default
    self.status ||= 0
    self.report ||= ''
  end
end
