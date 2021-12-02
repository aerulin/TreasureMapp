class ChallengesController < ApplicationController

  def show
    @challenge = Challenge.find(params[:id])
  end

  def new
    @question = Question.find(params[:question_id])
    @challenge = Challenge.find(params[:challenge_id])
    @challenge_question = ChallengeQuestion.new
  end

  def map
    @challenge = Challenge.find(params[:challenge_id])
    @challenge_question = ChallengeQuestion.new
    @markers = @challenge.mission.questions.map do |question|
      {
        lat: question.lat,
        lng: question.lng,
        info_window: render_to_string(partial: "popup_map", locals: { question: question, challenge: @challenge, challenge_question: @challenge_question })
      }
    end

    @questions = @challenge.mission.questions.map do |question|
      question.question
    end

  end

  def create
    challenge = Challenge.new
    challenge.user = current_user
    challenge.mission = Mission.find(params[:mission_id])
    challenge.save
    redirect_to challenge_path(challenge)
  end

  private

  def questions_params
    params.require(:question).permit(:lat, :lng)
  end
end
