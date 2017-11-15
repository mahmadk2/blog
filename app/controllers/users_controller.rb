class UsersController < ApplicationController


before_action :set_user, only: [:edit, :update, :destroy, :show]
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
   
	end

	def update
    
     if @user.update(user_params)
     	flash[:success] = " Successfulluy update user information"
     	redirect_to users_path

     else

     	render 'edit'
     end
	end

	def destroy
    
     @user.destroy
     flash[:danger] = "user delete successfully"
     redirect_to users_path
	end

	def show
    
    @user_article = @user.articles.paginate(page: params[:page], per_page: 2)
	end


private
def user_params
	params.require(:user).permit(:username, :email, :password)
	
end
def set_user
  @user = User.find(params[:id])
end

end