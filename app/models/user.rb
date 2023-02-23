class User < ApplicationRecord
    # Add validation
    validates :email, uniqueness: true
    validates_format_of :email, with:/@/
    # presence checks not empty
    validates :password_digest, presence: true

    # method to produce secured password
    # need to set password_digest attribute
    has_secure_password

    has_many :products, dependent: :destroy
end
