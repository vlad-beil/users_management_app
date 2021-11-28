class User < ApplicationRecord
    validates :user_name, presence: true, length: { minimum: 3 }, uniqueness: true
end
