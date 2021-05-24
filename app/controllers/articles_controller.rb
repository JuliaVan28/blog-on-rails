class ArticlesController < ApplicationController
  def index
    @articles = Post.all
  end

  def show 
    @article = Post.find(params[:id])
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

  private
    def post_params
      params.require(:articles).permit(:title, :summary, :body)
    end
end
