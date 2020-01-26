class Plan < ApplicationRecord
      validates :user_id, {presence: true}
      validates :plan_name, {presence: true}

      
      belongs_to :user, optional: true
      has_many :posts
      accepts_nested_attributes_for :posts, allow_destroy: true

      
      
      
      
end
