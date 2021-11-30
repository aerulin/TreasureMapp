class Question < ApplicationRecord
  belongs_to :mission
  has_many :challenge_questions
end
