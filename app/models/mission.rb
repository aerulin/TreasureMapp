class Mission < ApplicationRecord
  has_many :challenges
  has_many :questions
end
