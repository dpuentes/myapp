class User < ApplicationRecord
	attr_accessor :remember_token
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
						format: { with: VALID_EMAIL_REGEX },
						uniqueness: { case_sensitive: false },
						uniqueness: true
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

	#Devuelve el resumen de hash de la cadena dada.
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
														BCrypt::Engine.cost
	BCrypt::Password.create(string, cost: cost)
	end

	# Devuelve un token aleatoria..
	def User.new_token
		SecureRandom.urlsafe_base64
	end

	# Recuerda a un usuario en la base de datos para su uso en sesiones persistentes.
	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end


	# Devuelve verdadero si el token dado coincide con el resumen.
	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	# Forgets a user.
	def forget
		update_attribute(:remember_digest, nil)
	end

	# Devuelve el resumen de hash de la cadena dada.
	def self.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
		BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
	# Devuelve una ficha aleatoria.
	def self.new_token
		SecureRandom.urlsafe_base64
	end

end
