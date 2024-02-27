class User < ApplicationRecord
    validates :username, :email, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end