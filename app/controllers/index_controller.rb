class IndexController < ApplicationController
  def home
  	@article = Article.publish
  end

  def about
  end
end
