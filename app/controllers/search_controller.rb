class SearchController < ApplicationController
	def search
		 @articles = Article.search(params[:query])
	end
end
