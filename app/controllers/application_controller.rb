class ApplicationController < ActionController::Base

private

	def require_signin
		unless current_user
			session[:intended_url] = request.url
			redirect_to new_session_url, alert: "You have to sign in dude!!!"
		end
	end

	def current_user?(a)
		current_user == a
	end

	def logged_admin?
		current_user && current_user.admin?		
	end

	def current_user
	  	@current_user ||= User.find(session[:user_id]) if session[:user_id]  	
	end

  	def require_admin
      unless logged_admin?
        redirect_to root_path, alert: 'You are not the boss here, ask me (Akiro) 
                                        for admin priviledges you fool.'
      end
  	end

	helper_method :current_user
	helper_method :current_user?
	helper_method :logged_admin?
end

