class MissionsController < ApplicationController
  def index
    @missions = Mission.all
  end

  def show
  end
end
