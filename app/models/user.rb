require 'bcrypt'

class User < ApplicationRecord
    # users.password_hash in the database is a :string
    include BCrypt
    belongs_to :rol
    
    def password
        @password ||= Password.new(password_hash)
    end
  
    def password=(new_password)
        @password = Password.create(new_password)
        self.password = @password
    end
end
