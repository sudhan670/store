class PagesController < ApplicationController
  before_action :require_login

  def admin
    require_admin
    @polls = Poll.order(created_at: :desc)
  end

  def user
    @active_poll = Poll.all.find(&:active_now?)
    @my_vote = Vote.find_by(user: current_user, poll: @active_poll) if @active_poll
    @past_polls = Poll.find_by(active: 0)
  end
end