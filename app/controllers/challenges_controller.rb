class ChallengesController < ApplicationController

  def show
    @questions = Question.where(mission_id:params[:id])
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)

    @markers = @questions.map do |question|
      { lat: question.lat, lng: question.lng }
    end

  end

  def new
  end

  def create
  end

end

private

def questions_params
    params.require(:question).permit(:lat, :lng)
end
