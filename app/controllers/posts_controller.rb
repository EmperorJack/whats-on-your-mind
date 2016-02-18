class PostsController < ApplicationController

  def index
    @posts = Post.all.latest
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save

    new
    render :new
  end

  private

    def post_params
      params.require(:post).permit(:name, :subject, :message)
    end

end
