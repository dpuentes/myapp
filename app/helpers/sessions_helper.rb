module SessionsHelper
	# Inicia sesión en el usuario dado.
	def log_in(user)
		session[:user_id] = user.id
	end

	# Devuelve el usuario que ha iniciado sesión actualmente (si lo hay).
def current_user
		if session[:user_id]
			@current_user ||= User.find_by(id: session[:user_id])
		end
	end

# Devuelve verdadero si el usuario ha iniciado sesión, falso en caso contrario.
	def logged_in?
	    !current_user.nil?
	end
	# Desconecta a la usuario actual.
	def log_out
		reset_session
		@current_user = nil
	end
end
