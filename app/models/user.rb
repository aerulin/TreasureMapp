class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :challenges

  # class method to sum the scores stored in all challenges belonging to user
  def calculate_score
    challenges.sum(:score)
  end
end
