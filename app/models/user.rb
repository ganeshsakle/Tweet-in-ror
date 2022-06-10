class User < ApplicationRecord
    before_save {self.email = email.downcase}
    validates :name, presence: true
    VALID_REGEX_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: {with: VALID_REGEX_EMAIL}, uniqueness: true
end
