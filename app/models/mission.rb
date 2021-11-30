class Mission < ApplicationRecord
  has_many :challenges
  has_many :questions
  has_many :clues
end
