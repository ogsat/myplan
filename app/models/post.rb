class Post < ApplicationRecord
  validates :user_id, {presence: true}
  validates :place_name, {presence: true}
  belongs_to :plan, optional: true
  mount_uploader :place_image, ImageUploader
  
  def user
    return User.find_by(id: self.user_id)
  end
  
end
