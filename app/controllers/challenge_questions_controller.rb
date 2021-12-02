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
    if params[:challenge_question][:guess].downcase == question.answer.downcase
      challenge_question.status = true
      challenge_question.save!
      redirect_to challenge_path(challenge)
    else
      challenge_question.save!
      flash[:alert] = "Fausse réponse! Essayez à nouveau."
      redirect_to challenge_map_path(challenge)
    end
  end

  private

  def q_params
    params.require(:question_challenge).permit(:status, :guess)
  end

end
