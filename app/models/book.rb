class Book < ApplicationRecord

  has_one_attached :profile_image

  has_many :favorites, dependent: :destroy
  belongs_to :user, optional: true


  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200}

  def get_image
    if image.attached?
      profile_image
    else
      'no_image.jpg'
    end
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end


end
