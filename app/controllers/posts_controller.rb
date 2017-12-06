class PostsController < ApplicationController

before_action :authenticate_user!, except: [:index, :show]

	def index
		@posts = Post.all
	end

	def new
		@post = current_user.posts.build
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = @post = current_user.posts.build(post_params)
		
		if (@post.save)
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if (@post.update(post_params))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def puts(string)
  		super(string.truncate(45))
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private def post_params
		params.require(:post).permit(:title, :body)
	end

end
