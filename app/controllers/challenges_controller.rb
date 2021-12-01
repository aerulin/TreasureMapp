class ChallengesController < ApplicationController
  def show
    @challenge = Challenge.find(params[:id])
  end

  def new
  end

  def create
  end
end
