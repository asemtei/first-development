class SessionsController < ApplicationController

	def new	
	end

	def create
		if 	u = User.authenticate(params[:usermail], params[:password]) 
		then
			session[:user_id] = u.id
			flash[:notice] = "Welcome back, #{u.name}!"
			redirect_to(session[:intended_url] || u)
			session[:intended_url] = nil
		else	
			flash.now[:alert] = "Incorrect password or username combination pal"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: "Thank you, come again!"
	end
end
