class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new

  end

  def create
    @post = Post.new(post_params)
    @post.save

    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end
  #Strong parameters:

  #Rails 4 has a security feature called Strong Params - you have to define or explicity say what parameters you want to allow. Under a private method:

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
