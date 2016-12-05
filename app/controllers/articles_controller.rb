class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  # Create article index of all articles
  def index
    @articles = Article.all
  end
  
  # Method for new articles
  def new
    @article = Article.new
  end
  
  # Method for editing articles
  def edit
    
  end
  
  # Method for creating a new article with messages or renders the 'new' view
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render "new"
    end
  end
  
  # Method for updating articles or renders the 'edit' view
  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render "edit"
    end
  end
  
  # Show the article
  def show
    
  end
  
  #Destroy the selected article
  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
    
    def set_article
      @article = Article.find(params[:id])
    end
end