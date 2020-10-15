class Category < ApplicationRecord
  has_many :articles
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :name, length: {
    minimum: 2,
    maximum: 20,
    # too_short: "must have at least 2 words",
    # too_long: "20 characters is the maximum allowed"
  }
  validates :priority, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
