class Book < ApplicationRecord

  has_one_attached :profile_image

  belongs_to :user, optional: true

  def get_image
    if image.attached?
      profile_image
    else
      'no_image.jpg'
    end
  end
end
