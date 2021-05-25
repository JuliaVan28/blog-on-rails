class ArticlesController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]
  def index
    @articles = Post.all
  end

  def show 
  
  end

  def new
    @article = Post.new
  end

  def create
    @article = Post.new(post_params)
    if @article.save
      redirect_to articles_path({:id => @article.id})
    else
      render :new
    end
  end

  def edit
  end

  def update
    @article = Post.find(params[:id])
    if @article.update_attributes(post_params)
      redirect_to articles_path({:id => @article.id})
    else
      render :edit
    end
  end

  def destroy
    @article.destroy

    redirect_to root_path
  end
  def set_post
    @article = Post.find(params[:id])
  end
  private
    def post_params
      params.require(:articles).permit(:title, :summary, :body, :image, :all_tags)
    end
end
