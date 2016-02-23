class PostsController < ApplicationController

  def index
    @posts = Post.tonight.latest
  end

  def anon
    @person = "Anon"
    @posts = (Post.tonight.anon + Post.tonight.no_tags).sort! { |a,b| b.created_at <=> a.created_at }
    render :index
  end

  def avatar
    @person = "Avatar"
    @posts = (Post.tonight.avatar + Post.tonight.no_tags).sort! { |a,b| b.created_at <=> a.created_at }
    render :index
  end

  def profile
    @person = "Profile"
    @posts = (Post.tonight.profile + Post.tonight.no_tags).sort! { |a,b| b.created_at <=> a.created_at }
    render :index
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

  def feed
    last_post_id = params[:last_post_id]

    response = []

    if Post.count > 0

      Post.where("id > ?", last_post_id).each do |post|
        response << post
      end

    end

    render :json => response
  end

  private

    def post_params
      params.require(:post).permit(:name, :subject, :message)
    end

end
