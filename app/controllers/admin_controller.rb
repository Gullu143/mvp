class AdminController < ApplicationController
	load_and_authorize_resource class: false

 	def admin_dashboard
 		@seller = Seller.all
 		@buyer  = Buyer.all
 		@article = Article.all
  	end

end
