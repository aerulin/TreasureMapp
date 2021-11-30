class Challenge < ApplicationRecord
  belongs_to :user
  belongs_to :mission
  has_many :challenge_questions
end
