class Author < ApplicationRecord
    has_mant :books, ->{
        order(year: :desc)
    }
end
