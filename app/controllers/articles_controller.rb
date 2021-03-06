class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article was successfully created."
      redirect_to articles_path(@article)
    else
      render 'new'
    end
    #respond_to do |format|
    #  if @article.save
    #    format.html { redirect_to @article, success: 'Article was successfully created.' }
    #    #flash[:notice] = 'Article was successfully created.'
    #    format.json { render :show, status: :created, location: @article }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @article.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    if @article.update(article_params)
      flash[:success] = 'Article was successfully destroyed.'
      redirect_to articles_path(@article)
    else 
      render 'edit'
    end
    #respond_to do |format|
      #if @article.update(article_params)
      #  format.html { redirect_to @article, success: 'Article was successfully updated.' }
      #  format.json { render :show, status: :ok, location: @article }
      #else
      #  format.html { render :edit }
      #  format.json { render json: @article.errors, status: :unprocessable_entity }
      #end
    #end
    
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    flash[:danger] = 'Article was successfully destroyed.'
    redirect_to articles_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
