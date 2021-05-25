class ArticlesController < ApplicationController
   include Pagy::Backend

   before_action :authenticate_user!, except: [:index, :show]

  before_action :set_post, only: [ :show, :edit, :update, :destroy ]
  def index
   @pagy, @articles = pagy(Post.all, items: 5)
  end

  def show 
  
  end

  def new
    @article = Post.new
  end

  def create
    @article = Post.new(post_params)
    if @article.save
      redirect_to articles_path({:id => @article.id}), success: 'Successfully uploaded'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @article = Post.find(params[:id])
    if @article.update_attributes(post_params)
      redirect_to articles_path({:id => @article.id}), success: 'Successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy

    redirect_to root_path
  end

  def search
    # @article = Post.where("title LIKE :search", search: params[:q])
    # if params[:search].blank?  
    #   redirect_to(root_path) and return  
    # else  
    #   @parameter = params[:search].downcase  
    #   @articles = Post.all.where("lower(title) LIKE :search", search: @parameter)  
    # end  
  
      if params[:search].blank?  
        redirect_to(root_path, alert: "Empty field!") and return  
      else  
        @parameter = params[:search].downcase  
        @results = Post.all.where("lower(title) LIKE :search", search: @parameter)  
      end  
  end 

  def set_post
    @article = Post.find(params[:id])
  end
  private
    def post_params
      params.require(:articles).permit(:title, :summary, :body, :image, :all_tags)
    end
end
