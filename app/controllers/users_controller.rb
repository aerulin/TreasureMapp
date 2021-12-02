class UsersController < ApplicationController
  def index
    # Gathers all users sorted by score (through a class method in User model)
    @users = User.all.sort_by { |user| -user.calculate_score }
  end

  def playground
    users = User.all.sort_by { |user| -user.calculate_score }
    @rank = users.index(current_user) + 1
    if @rank == 1
      @users_shortlist = users[0...3]
    else
      @users_shortlist = users[(@rank - 2)...(@rank + 1)]
    end

    @open_challenges = Challenge.where(user: current_user, status: 'started')
    @done_challenges = Challenge.where(user: current_user, status: 'finished')
  end
end
