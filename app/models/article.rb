class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :votes, dependent: :destroy
  has_one_attached :image

  validates :title, presence: true
  validates :title, length: {
    minimum: 6,
    maximum: 80
  }

  validates :text, presence: true
  validates :text, length: {
    minimum: 10
  }
  validates :category_id, presence: true
  validates :image, presence: true

  scope :heros, -> { order(created_at: :desc).includes(:author) }
  scope :ordred_by_votes, -> { order(votes_count: :desc).includes(:category) }
  scope :with_attached_image, -> { includes(image_attachment: :blob) }
  scope :with_image_category, -> { includes(image_attachment: :blob).includes(:category) }

  def votes_count
    votes.count
  end

  def cover_image
    image.variant(resize: '200x200')
  end

  def hero_image
    image.variant(resize: '300x300')
  end

  def display_image
    image.variant(resize: '1000x1000')
  end
end
