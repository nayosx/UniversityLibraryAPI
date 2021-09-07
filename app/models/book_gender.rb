class BookGender < ApplicationRecord
  belongs_to :Book
  belongs_to :Gender
end
