class Post < ApplicationRecord
  # バリデーション
  validates :user_id, {presence: true}
  validates :place_name, {presence: true}
  validates :arrival_time, {presence: true}
  
  # planモデルと関連付け
  belongs_to :plan, optional: true
  
  # 画像アップロード
  mount_uploader :place_image, ImageUploader
  
  def user
    return User.find_by(id: self.user_id)
  end
  
end
