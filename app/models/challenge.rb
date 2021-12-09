class Challenge < ApplicationRecord
  belongs_to :user
  belongs_to :mission
  has_many :challenge_questions
  attr_accessor :long, :lat

  BONUS = {
    'facile' => 0.1,
    'moyen' => 0.3,
    'difficile' => 0.5
  }

  def progress
    nb_questions = mission.questions.count + 1
    true_questions = challenge_questions.where(status: true).count
    return 0 if nb_questions.zero?

    (true_questions / nb_questions.to_f * 100).to_i
  end

  def calculate_score
    # retrieve parameters (question answered, nb of guesses etc.)
    nb_question_answered = challenge_questions.where(status: true).count
    nb_questions_guess = challenge_questions.map { |question| question[:answer_counter] }.sum
    bonus = BONUS[mission.difficulty.downcase]
    status ? end_mission = 1 : end_mission = 0

    pt_q_answered = 50
    pt_q_guess = -5
    pt_final_guess = -15
    pt_end_mission = 200

    # points per entry
    final_q_answered = pt_q_answered * nb_question_answered
    final_q_guess = pt_q_guess * (nb_questions_guess - nb_question_answered)
    if secret_counter.positive?
      final_location_guess = pt_final_guess * (secret_counter - 1)
    else
      final_location_guess = 0
    end
    final_end_mission = pt_end_mission * end_mission

    # calculation for score
    score = (final_q_answered + final_q_guess + final_location_guess + final_end_mission)
    score_bonus = (score * bonus).to_i
    final_score = score + score_bonus
    # @time = challenge.updated_at.strftime("%d-%m-%Y %H:%M:%S") - challenge.created_at.strftime("%d-%m-%Y %H:%M:%S")

    # prepare hash
    {
      question_answered: nb_question_answered,
      question_points: pt_q_answered,
      score_questions: final_q_answered,
      question_guess: nb_questions_guess,
      guess_malus: pt_q_guess,
      score_guess: final_q_guess,
      final_guess_malus: pt_final_guess,
      final_guess: secret_counter,
      score_final_guess: final_location_guess,
      mission_done: status,
      score_end_mission: pt_end_mission,
      mission_points: final_end_mission,
      final_score: final_score,
      mission_difficulty: mission.difficulty,
      bonus: bonus,
      bonus_points: score_bonus
    }
  end

end
