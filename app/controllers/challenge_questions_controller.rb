class ChallengeQuestionsController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @challenge = Challenge.find(params[:challenge_id])
    @challenge_question = ChallengeQuestion.new
  end

  def validate
    question = Question.find(params[:question_id])
    challenge = Challenge.find(params[:challenge_id])

    challenge_question = ChallengeQuestion.find_or_create_by(question: question, challenge: challenge)
    challenge_question.answer_counter += 1
    user_guess = params[:challenge_question][:guess].downcase.split
    question_validation = question.validation
    intersection = user_guess & question_validation

    if intersection.empty?
      challenge_question.save!
      flash[:bad_answer] = ''
      redirect_to challenge_map_path(challenge)
    else
      challenge_question.status = true
      challenge_question.save!
      redirect_to challenge_path(challenge)
      flash[:good_answer] = ''
    end
  end

  def button

  end


  private

  def q_params
    params.require(:question_challenge).permit(:status, :guess)
  end

end
