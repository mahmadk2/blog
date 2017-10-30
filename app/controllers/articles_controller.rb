class ArticlesController < ApplicationController

before_action :set_act, only:[:edit, :show, :update, :destroy]
def index
@articles = Article.all
end
def new
	@article = Article.new
end
def create
 debugger	
 @article = Article.new(article_params) 
 @article.user = User.first
 if @article.save
 	flash[:success] = "Article Successfully Created"
 redirect_to article_path(@article)
else
	render 'new'
end
end
def show

end

def edit


end

def update

if @article.update(article_params)
	flash[:success] = "Article Updated Successfully"
	redirect_to article_path(@article)
else render 'edit'
end
end

 def destroy


@article.destroy

flash[:danger] = "Article was Successfully Deleted"

redirect_to articles_path

end
private

def set_act
@article = Article.find(params[:id])
	end

def article_params

	params.require(:article).permit(:title, :description)
	
end

end