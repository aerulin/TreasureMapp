class ChallengesController < ApplicationController

  def show
  end

  def map
    @challenge = Challenge.find(params[:challenge_id])
    @markers = @challenge.mission.questions.map do |question|
      { lat: question.lat, lng: question.lng, question: question.question }
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
