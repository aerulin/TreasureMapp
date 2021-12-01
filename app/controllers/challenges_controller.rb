class ChallengesController < ApplicationController
  def show
    @challenge = Challenge.find(params[:id])
  end

  def new
    @challenge = Challenge.new
  end

  def create
  end
end
