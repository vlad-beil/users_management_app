class User < ApplicationRecord
    validates :user_name, presence: true, length: { minimum: 3 }, uniqueness: true
    has_many :blog_posts, dependent: :delete_all
end
