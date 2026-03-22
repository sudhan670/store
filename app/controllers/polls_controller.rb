# app/controllers/polls_controller.rb
class PollsController < ApplicationController
  before_action :require_login
  before_action :require_admin, only: [:new, :create]

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(
      start_time:    params[:start_time],
      end_time:      params[:end_time],
      hotel_name: params[:hotel_name],
      created_by_id: current_user.id
    )
    if @poll.save
      flash[:notice] = "Poll created"
      redirect_to admin_path
    else
      flash[:alert] = @poll.errors.full_messages.join(", ")
      redirect_to admin_path
    end
  end
end