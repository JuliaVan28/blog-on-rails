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

  def edit
    @article = Post.find(params[:id])
  end

  def update
    @article = Post.find(params[:id])
    @article.assign_attributes(post_params)

    if @article.save
      redirect_to articles_path({:id => @article.id})
    else
      render :edit
    end
  end

  def destroy
    @article = Post.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
    def post_params
      params.require(:articles).permit(:title, :summary, :body, :image)
    end
end
