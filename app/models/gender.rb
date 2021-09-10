class Gender < ApplicationRecord

    has_many :book_genders
    has_many :books, through: :book_genders
end
