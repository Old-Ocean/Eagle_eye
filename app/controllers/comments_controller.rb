class CommentsController < ApplicationController

	def create
		@comment.
		
	end

	def index
		@comments = Comment.all
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def edit
		
	end

	def destroy
		
	end

end
