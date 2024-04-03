class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception
	helper_method :current_personnel

	def current_personnel
	  @current_personnel ||= Personnel.find_by_auth_token( cookies[:auth_token]) if cookies[:auth_token]
	end
end
