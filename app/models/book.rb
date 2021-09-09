class Book < ApplicationRecord

    belongs_to :author

    def self.search(pattern, typeSearch)
        if pattern.blank?  # blank? covers both nil and empty string
          all
        else
            case typeSearch
            when 'author'
                where('autor LIKE ?', "%#{pattern}%")
            when 'gender'
                where('gender LIKE ?', "%#{pattern}%")
            else
                where('title LIKE ?', "%#{pattern}%")
            end
        end
      end
end
