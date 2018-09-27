class ArticlesController < ApplicationController
  before_action :fetch_article, only:[:show, :edit, :update, :destroy]
  
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end
  
  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path
  end

  def update
    if @article.update(article_params)
      redirect_to article_path, notice: 'ブログを更新しました'
    else 
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def confirm
    @article = Article.new(article_params)
    render 'new' if @article.invalid?
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :content)
  end
  
  def fetch_article
    @article = Article.find(params[:id])
  end
end
