class ChallengeQuestion < ApplicationRecord
  belongs_to :challenge
  belongs_to :question
  attr_accessor :guess
end
