class ApplicationController < ActionController::Base

	def current_ability
	  if seller_signed_in?
	    @current_ability ||= Ability.new(current_seller)
	  else
	    @current_ability ||= Ability.new(current_buyer)
	  end
	end

end
