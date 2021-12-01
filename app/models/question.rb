class Question < ApplicationRecord
  belongs_to :mission
  has_many :challenge_questions
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
end
