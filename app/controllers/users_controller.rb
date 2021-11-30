class UsersController < ApplicationController
  def index
    # Gathers all users sorted by score (through a class method in User model)
    @users = User.all.sort_by { |user| -user.calculate_score }
  end
end
