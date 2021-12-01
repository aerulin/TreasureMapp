class ChallengesController < ApplicationController

  def show
    # @test = Question.last.question
    @questions = Question.where(mission_id:params[:id])
    @test = @questions.map do |question|
      question.question
    end
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @questions.map do |question|
      { lat: question.lat, lng: question.lng, question: question.question }
    end
  end

  def create
    challenge = Challenge.new
    challenge.user = current_user
    challenge.mission = Mission.find(params[:mission_id])
    challenge.save
    redirect_to mission_challenge_path(challenge)
  end

  private

  def questions_params
    params.require(:question).permit(:lat, :lng)
  end

end
