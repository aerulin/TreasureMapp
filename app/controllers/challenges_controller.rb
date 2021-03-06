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
    @markers = @challenge.mission.questions.map do |question|
      @challenge_question = ChallengeQuestion.find_by(question: question, challenge: @challenge)
      @challenge_question = ChallengeQuestion.new if @challenge_question.nil?
      {
        lat: question.lat,
        lng: question.lng,
        status: @challenge_question.status,
        info_window: render_to_string(partial: "popup_map", locals: { question: question, challenge: @challenge, challenge_question: @challenge_question })
      }
    end

    @questions = @challenge.mission.questions.map do |question|
      question.question
    end
  end

  def map_all_challenges
    @challenge_open = Challenge.where(user: current_user, status: false)

    @markers = []
    @challenge_open.each do |challenge|
      challenge.mission.questions.each do |question|
        @challenge_question = ChallengeQuestion.find_by(question: question, challenge: challenge)
        p "*************************"
        p challenge.inspect
        p question.inspect
        @challenge_question = ChallengeQuestion.new if @challenge_question.nil?
        @markers << {
          lat: question.lat,
          lng: question.lng,
          status: @challenge_question.status,
          info_window: render_to_string(partial: "popup_map_all", locals: { question: question, challenge: challenge, challenge_question: @challenge_question })
        }
      end
      @questions = challenge.mission.questions.each do |question|
      question.question
    end
    end
    #redirect_to challenge_score_path(challenge)
end



  def create
    challenge = Challenge.new
    challenge.user = current_user
    challenge.mission = Mission.find(params[:mission_id])
    challenge.save
    redirect_to challenge_path(challenge)
  end

  # Geolocalisation validation
  def validate
    challenge = Challenge.find(params[:challenge_id])
    mission_id = challenge.mission_id

    # place from mission
    latitude = Mission.find(mission_id).lat
    longitude = Mission.find(mission_id).lng

    place = [latitude, longitude]
    delta = 0.001000
    # user_lat = 46.505406
    user_lat = params[:lat]
    # user_long = 6.641385
    user_long = params[:lon]

    # test = user_lat.between?(place[0] - delta, place[0] + delta)
    if user_lat.between?(place[0] - delta, place[0] + delta) && user_long.between?(place[1] - delta, place[1] + delta)
      challenge.status = true
      challenge.score = challenge.calculate_score[:final_score]
      challenge.save
      render json: { location: challenge_score_path(challenge) }
    else
      flash[:falsy] = "Oups! Il semblerait que ce ne soit pas le bon endroit, essayez encore!"
      render json: { location: challenge_path(challenge) }
    end
  end

  def score
    @challenge = Challenge.find(params[:challenge_id])
  end

  private

  def questions_params
    params.require(:question).permit(:lat, :lng)
  end

end
