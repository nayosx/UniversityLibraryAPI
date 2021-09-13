class User < ApplicationRecord
    has_secure_password
    has_secure_password :recovery_password, validations: false

    belongs_to :rol
    has_many :loans
    has_many :books, through: :loans

    validates :email, presence: true, uniqueness: true, on: :create
    validates :password, presence: true, on: :create
    #validates :rol_id, presence: true, on: :create

    #attr_accessor :rol_id, :name, :lastname, :email, :phone, :created_at, :updated_at
    #attr_accessor :password_digest
end
