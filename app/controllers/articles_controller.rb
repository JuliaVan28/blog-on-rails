class ArticlesController < ApplicationController
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
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new.html.erb
    end
  end

  private
    def post_params
      params.require(:articles).permit(:title, :summary, :body)
    end
end
