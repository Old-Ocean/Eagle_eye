class LikesController < ApplicationController
	def create
		comment = Comment.find_by(params[:comment_id])
		Like.create(comment_id: comment.id, user_id: current_user.id)
		redirect_to article_path(comment.article_id)
	end

	def destroy
		# binding.pry
		comment = Comment.find_by(params[:comment_id])
		like = Like.find_by(comment_id: comment.id, user_id: current_user.id)
		like.destroy
		redirect_to article_path(comment.article_id)
	end
end
