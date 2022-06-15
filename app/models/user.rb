class User < ApplicationRecord
    before_save {self.email = email.downcase}
    validates :name, presence: true
    VALID_REGEX_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: {with: VALID_REGEX_EMAIL}, uniqueness: true
    has_secure_password
    validates :password, presence: true, length: {minimum: 6}, allow_nil: true

    def User.new_token    # returns a random token of 22 char
        SecureRandom.urlsafe_base64 
    end

end
