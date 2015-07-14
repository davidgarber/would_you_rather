class Question < ActiveRecord::Base
  acts_as_votable

  has_many :comments
  validates :title, :presence => true
  validates :answer_a, :presence => true
  validates :answer_b, :presence => true
end
