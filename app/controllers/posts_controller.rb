class PostsController < ApplicationController

  def index
    @posts = Post.all.latest
  end

  def anon
    @person = "Anon"
    @posts = Post.anon.latest
    render :index
  end

  def avatar
    @person = "Avatar"
    @posts = Post.avatar.latest
    render :index
  end

  def profile
    @person = "Profile"
    @posts = Post.profile.latest
    render :index
  end

  def new
    @posts = Post.anon.latest
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
