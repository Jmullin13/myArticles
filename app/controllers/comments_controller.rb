class CommentsController < ApplicationController


	def create
		@article = Article.find(params[:article_id])
		permitted_columns = params[:comment].permit(:commenter, :description)
		@comment = @article.comments.create(permitted_columns)

		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy

		redirect_to article_path(@article)
	end
end