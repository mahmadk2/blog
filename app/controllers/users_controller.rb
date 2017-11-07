class UsersController < ApplicationController

  def index
   @users = User.all.paginate(page: params[:page], per_page: 5)
  end
def new
@user = User.new 

end

def  create

@user = User.new(user_params)
if @user.save
   flash[:success] = "successfully user created #{@user.username}"
   redirect_to users_path
	else

		render 'new'

end		
end

def edit
   @user = User.find(params[:id])
	end

	def update
     @user = User.find(params[:id])
     if @user.update(user_params)
     	flash[:success] = " Successfulluy update user information"
     	redirect_to users_path

     else

     	render 'edit'
     end
	end

	def destroy
     @user = User.find(params[:id])
     @user.destroy
     flash[:danger] = "user delete successfully"
     redirect_to users_path
	end

	def show
    @user = User.find(params[:id])
    @user_article = @user.articles.paginate(page: params[:page], per_page: 2)
	end


private
def user_params
	params.require(:user).permit(:username, :email, :password)
	
end

end