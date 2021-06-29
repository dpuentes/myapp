class User < ApplicationRecord
	attr_accessor :remember_token, :activation_token
	before_save :downcase_email
	before_create :create_activation_digest
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
						format: { with: VALID_EMAIL_REGEX },
						uniqueness: { case_sensitive: false },
						uniqueness: true
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

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

	# Devuelve verdadero si el token dado coincide con el resumen.
	def authenticated?(attribute, token)
		digest = send("#{attribute}_digest")
		return false if digest.nil?
		BCrypt::Password.new(digest).is_password?(token)
	end

	# Activates an account.
	def activate
          update_columns(activated: true, activated_at: DateTime.now)
	end

	# Sends activation email.
	def send_activation_email
		UserMailer.account_activation(self).deliver_now
	end

	private

	# Convierte el correo electrónico en minúsculas.
	def downcase_email
		self.email = email.downcase
	end

	# Creates and assigns the activation token and digest.
	# Crea y asigna el token de activación y el token digest.
	def create_activation_digest
		self.activation_token = User.new_token
		self.activation_digest = User.digest(activation_token)
	end
end
