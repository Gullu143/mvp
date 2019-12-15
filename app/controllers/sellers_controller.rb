class SellersController < ApplicationController
	before_action :authenticate_seller!

	def profile
		@seller = current_seller
	end

	def my_draft
	 @article = Article.draft
	end
end

