class SessionsController < ApplicationController

	def new
		@original_url=params[:original_url]
	end

	def create
	  personnel = Personnel.find_by(email: params[:login][:email].downcase)
	  if personnel && personnel.authenticate(params[:login][:password])
	    session[:personnel_id] = personnel.id.to_s
	    # Redirect to the desired path after successful login
	    redirect_to your_desired_path, notice: 'Successfully logged in!'
	  else
	    flash.now[:alert] = 'Invalid email or password'
	    render 'new'
	  end
	end

	# def create
	#   if params[:login].present?
	#     personnel = Personnel.find_by(email: params[:login][:email].downcase)
	#     if personnel && personnel.authenticate(params[:login][:password])
	#       session[:personnel_id] = personnel.id.to_s
	#       # Redirect to the desired path after successful login
	#       redirect_to your_desired_path, notice: 'Successfully logged in!'

	#     else
	#       flash.now[:alert] = 'Invalid email or password'
	#       render 'new'
	#     end
	#   else
	#     # Handle the case where login params are missing
	#      # flash.now[:alert] = 'Invalid email or password'
	#      render 'new'
	#   end
	# end

end
