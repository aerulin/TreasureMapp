class MissionsController < ApplicationController
  def index
  end

  def show
    @mission = Mission.find(params[:id])
  end
end
