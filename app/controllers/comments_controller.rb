class CommentsController < ApplicationController
  def index
  	@comment = Comment.all
  end

  def show
  	@comment =Comment.find(params[:id])
  end

  def edit
    @buyer   = current_buyer
  	@comment =Comment.find(params[:id])
  end

  def new
  	@comment = Comment.new
    @buyer   = current_buyer

  end

  def create
  	@comment = Comment.new(comment_params)
    @article = @comment.article
  	@comment.save
  	redirect_to @article, notice: "comment posted successfully"
  end

  def update
  	@comment = Comment.find(params[:id])
  	if @comment.update
  		redirect_to article_path, notice: "comment updated successfully"
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	if @comment.destroy
  		redirect_to article_path, notice: "your comment deleted successfully"
  	else
  		redirect_to article_path, alert: "comment not deleted"
  	end
  end

  private
  def comment_params
  	params.require(:comment).permit(:commenter, :article_id, :buyer_id)
  end
end
