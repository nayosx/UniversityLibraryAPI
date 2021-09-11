class User < ApplicationRecord
    belongs_to :rol
    has_secure_password
    has_secure_password :recovery_password, validations: false

    has_many :loans
    has_many :books, through: :loans

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
end
