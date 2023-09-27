class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    # before_action :article_params, only: [:edit, :update]
    def show
        # byebug
        # if Article.find(params[:id]).nil?
        # end
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        @article = Article.new(article_params)
        # render plain: params[:article]
        # render plain: @article.inspect
        if @article.save
            flash[:notice] = "Article is created successfully."
            flash.keep(:notice) #keep the flash entry available for the next action
            # redirect_to article_path(@article)    #articles/is
            redirect_to @article                  #same as above
            # redirect_to articles_path             #show all - index
            # redirect_to @articles                 #not working
        else
            render 'new'
        end
    end

    def update
        if @article.update(article_params)
            flash[:notice] = "Article is updated successfully."
            flash.keep(:notice) #keep the flash entry available for the next action
            # redirect_to article_path(@article)    #articles/is
            redirect_to @article                  #same as above
            # redirect_to articles_path             #show all - index
            # redirect_to @articles                 #not working
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        flash[:notice] = "Article is deleted successfully."
        redirect_to articles_path
    end
    private
        def set_article
            @article = Article.find(params[:id]) 
        end

        def article_params
            params.require(:article).permit(:title, :description)
        end
end