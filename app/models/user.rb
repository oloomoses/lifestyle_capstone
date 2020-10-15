class User < ApplicationRecord
  has_many :articles
  has_many :votes, dependent: :destroy

  validates :name, uniqueness: { case_sensitive: false }, presence: true
  validates :name, length: {
    minimum: 3
    # too_short: 'must have at least 3 characters'
  }
end
