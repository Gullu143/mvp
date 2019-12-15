class ArticlesController < ApplicationController
   before_action :authenticate_seller!, :except => [:show, :index]
   load_and_authorize_resource :except => [:index, :show]
  def index
  	@article = Article.publish
  end

  def new
    @seller = current_seller
  	@article = Article.new
  end

  def edit
    @seller = current_seller
  	@article = Article.find(params[:id])
  end

  def show
    @comments = Comment.all
    @comment = Comment.new
    @buyer = current_buyer
  	@article = Article.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
          render pdf: "article no. #{@article.id}",
          page_size: 'A4',
          template: "articles/show.html.erb",
          layout: "pdf.html",
          orientation: "Landscape",
          lowquality: true,
          zoom: 1,
          dpi: 75
      end
    end
  end

  def create
  	@article = Article.new(article_params)
  	if @article.save
  		redirect_to @article, notice: "Article created"
  	else
		redirect_to new_article_path
  	end
  	
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path, notice: "Article updated successfully"
    else
        render 'edit'
    end	
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    if current_seller.admin?
      redirect_to admin_dashboard_path, notice: "Article deleted successfully "
    elsif current_seller
      redirect_to sellers_profile_path, notice: "Article deleted successfully "
    else
      redirect_to articles_path, notice: "Article deleted successfully "
    end
    
  end

  private
	def article_params
	 	params.require(:article).permit(:title, :description, :image, :seller_id, :status)
	end

end
