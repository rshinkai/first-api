class User < ApplicationRecord
    # Add validation
    validates :email, uniqueness: true
    validates_format_of :email, with:/@/
    # presence checks not empty
    validates :password, presence: true
end
