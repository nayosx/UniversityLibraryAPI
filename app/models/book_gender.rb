class BookGender < ApplicationRecord
    belongs_to :book
    belongs_to :gender
end
