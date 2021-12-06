class ChallengesController < ApplicationController

  def show
    @challenge = Challenge.find(params[:id])
  end

  def new
    @question = Question.find(params[:question_id])
    @challenge = Challenge.find(params[:challenge_id])
    @challenge_question = ChallengeQuestion.new
  end

  def geocode
    @location = {}
    @challenge = Challenge.find(params[:challenge_id])
  end

  def map
    @challenge = Challenge.find(params[:challenge_id])
    @markers = @challenge.mission.questions.map do |question|
      @challenge_question = ChallengeQuestion.find_by(question: question, challenge: @challenge)
      @challenge_question = ChallengeQuestion.new if @challenge_question.nil?
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


  # Geolocalisation validation


   def validate
      challenge = Challenge.find(params[:challenge_id])
      mission_id = challenge.mission_id

      # place from mission
      latitude = Mission.find(mission_id).lat
      longitude = Mission.find(mission_id).lat

      place = [latitude, longitude]
      delta = 0.003000

      ask_lat = request.location.latitude
      user_lat = ask_lat.to_f
      ask_long = request.location.longitude
      user_long = ask_long.to_f

      # form_lat = params[:challenge][:lat]
      # user_lat = form_lat.to_f
      # form_long = params[:challenge][:long]
      # user_long = form_long.to_f
      # latitude range
      # rlat = (place[0] + delta)..(place[0] - delta)
      puts "********************************"

      test = user_lat.between?(place[0] - delta, place[0] + delta)
      if user_lat.between?(place[0] - delta, place[0] + delta) && user_long.between?(place[1] - delta, place[1] + delta)
        puts "Woohooooo"
      else
        puts "Awwwwww"
      end
      redirect_to challenge_path(challenge)
      flash[:true] = "Bravo! Vous avez trouvé la bonne réponse."
  end

  def geolocate
    ask_lat = request.location.latitude
    user_lat = ask_lat.to_f
    ask_long = request.location.longitude
    user_long = ask_long.to_f
    raise

  def score
    @challenge = Challenge.find(params[:challenge_id])
  end

  private

  def questions_params
    params.require(:question).permit(:lat, :lng)
  end
end
