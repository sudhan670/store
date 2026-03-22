# app/controllers/votes_controller.rb
class VotesController < ApplicationController
  before_action :require_login

  def create
    poll = Poll.find(params[:poll_id])

    unless poll.active_now?
      flash[:alert] = "This poll is not active right now."
      return redirect_to user_path
    end

    existing = Vote.find_by(user: current_user, poll: poll)
    if existing
      existing.update(choice: params[:choice])
      flash[:notice] = "Your vote has been updated!"
    else
      Vote.create!(user: current_user, poll: poll, choice: params[:choice])
      flash[:notice] = "Vote submitted!"
    end

    redirect_to user_path
  end
end
