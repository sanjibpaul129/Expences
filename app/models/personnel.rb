class Personnel < ApplicationRecord


	has_secure_password

# 	def self.authenticate(email, password)
  #   personnel = find_by(email: email)
  #   if personnel && personnel.password_digest == BCrypt::Engine.hash_secret(password, personnel.password_salt)
  #     personnel
  #   else
  #     nil
  #   end
  # end
end
