class Challenge < ApplicationRecord
  belongs_to :user
  belongs_to :mission
  has_many :challenge_questions

  def progress
    nb_questions = mission.questions.count + 1
    true_questions = challenge_questions.where(status: true).count
    return 0 if nb_questions.zero?

    (true_questions / nb_questions.to_f * 100).to_i
  end
end
