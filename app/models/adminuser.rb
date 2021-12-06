class Adminuser < ApplicationRecord
        validates :password, presence: true, confirmation: true
    attr_accessor :password, :password_confirmation
    
    def password=(val)
        if val.present?
          self.pass2 = BCrypt::Password.create(val)
        end
        @password = val
    end
end
