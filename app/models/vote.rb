class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :poll

  CHOICES = %w[veg non_veg absent].freeze

  validates :choice, inclusion: { in: CHOICES }
  validates :user_id, uniqueness: { scope: :poll_id, message: "has already voted in this poll" }
end