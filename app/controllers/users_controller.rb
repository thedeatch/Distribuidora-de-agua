class UsersController < ApplicationController 
  before_action :authorize_admin, only: :create

  def index
    @users = User.all
  end 

  def admin
    @user = User.find params[:user_id]
    @user.toggle :admin if can? :manage, @user
    redirect_to @user 
  end  

  def edit
  	@user = User.find(params[:id])
  end


  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
     redirect_to users_path
   else
     render 'edit'
   end
  end 

    private

        def user_params
          params.require(:user).permit(:first_name, :last_name, :email, :password, :role )
        end

end
