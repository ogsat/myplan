class User < ApplicationRecord
  
    # パスワードハッシュ化
    has_secure_password
    
    # バリデーション
    validates :email,{uniqueness: true}
    validates :password,{presence: true}
    
    # planモデルと関連付け
    has_many :plans
    # postモデルと関連付け
    has_many :posts
    
    def posts
      return Post.where(user_id: self.id)
    end
end
