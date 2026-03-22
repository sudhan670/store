class Poll < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: :created_by_id
  has_many :votes

  validates :start_time, :end_time, :hotel_name, presence: true
  validate :end_time_after_start_time

  def active_now?
    Time.current.between?(start_time, end_time)
  end

  def vote_counts
    votes.group(:choice).count
  end

  private

  def end_time_after_start_time
    return unless start_time && end_time
    errors.add(:end_time, "must be after start time") if end_time <= start_time
  end
end