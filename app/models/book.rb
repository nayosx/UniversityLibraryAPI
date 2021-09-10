class Book < ApplicationRecord

    has_many :book_authors
    has_many :authors, through: :book_authors

    has_many :book_genders
    has_many :genders, through: :book_genders

    def self.search(pattern, typeSearch)
        if pattern.blank?  # blank? covers both nil and empty string
          all
        else
            case typeSearch
            when 'author'
                where('author LIKE ?', "%#{pattern}%")
            when 'gender'
                where('gender LIKE ?', "%#{pattern}%")
            else
                where('title LIKE ?', "%#{pattern}%")
            end
        end
      end
end
