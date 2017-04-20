class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		@comment.save

		redirect_to article_path(@comment.article_id)
	end

	private
	def comment_params
		params.require(:comment).permit(:body, :article_id, :user_id)
	end
end
