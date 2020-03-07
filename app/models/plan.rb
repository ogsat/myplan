class Plan < ApplicationRecord

      # バリデーション
      validates :user_id, {presence: true}
      validates :plan_name, {presence: true}

      # userモデルと関連付け
      belongs_to :user, optional: true
      
      # postsモデルと関連付け
      has_many :posts
      accepts_nested_attributes_for :posts, allow_destroy: true

end
