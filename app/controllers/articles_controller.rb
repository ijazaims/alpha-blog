class ArticlesController < ApplicationController
    def show
        # byebug
        # if Article.find(pa rams[:id]).nil?
            @article = Article.find(params[:id]) 
        # end
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id]) 
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
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
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
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
        @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "Article is deleted successfully."
        redirect_to articles_path
    end
end