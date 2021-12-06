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
      flash[:true] = "Bravo! Vous avez trouvé la bonne réponse."
    else
      challenge_question.save!
      flash[:false] = "Fausse réponse! Essayez à nouveau."
    end
    redirect_to challenge_map_path(challenge)
  end

  def button

  end

  private

  def q_params
    params.require(:question_challenge).permit(:status, :guess)
  end

end
