class User < ApplicationRecord
  has_secure_password
  has_many :votes
  has_many :polls, foreign_key: :created_by_id

  validates :username, presence: true, uniqueness: true
  validates :role, inclusion: { in: %w[user admin] }
end
