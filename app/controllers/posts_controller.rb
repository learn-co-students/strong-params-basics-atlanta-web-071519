class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		# strong params
		# only allows updates to title and description
	  @post = Post.new(post_params(:title, :descriptions))
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	#   strong params
	#   only allows updates to title 
	  @post.update(post_params(:title))
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private 

	# pass in in *args b/c this allows abstraction in the post_params method
	# so we can specify which fields the users are allowed to edit
	def post_params(*args)
		# strong params ...
		# can simply call post_params in the update and create method
		params.require(:post).permit(*args)
	end
end
