class ArticlesController < ApplicationController
  before_action :find_article, only: [:edit, :update, :show, :destroy]
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @article = Article.new
  end
  
  def edit
  end
  
  def update
    @article.user = User.last
    if @article.update(article_params)
      flash[:notice] = "Article sucessfully updated"
      redirect_to article_path(@article)
    else 
      render 'edit'
    end
  end
  
  def create
    @article = Article.new(article_params)
    @article.user = User.last
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def show
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was sucessfully deleted"
    redirect_to articles_path
  end
  
  private
  def find_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :description)
  end
  
end