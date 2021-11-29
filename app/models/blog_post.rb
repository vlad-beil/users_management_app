class BlogPost < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :post, presence: true
    belongs_to :user
end
