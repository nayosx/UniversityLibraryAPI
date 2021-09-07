class BookAuthor < ApplicationRecord
  belongs_to :Book
  belongs_to :Author
end
