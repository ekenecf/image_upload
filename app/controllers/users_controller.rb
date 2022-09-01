class UsersController < ApplicationController
  
    def index
      @users = User.all
    end
  
    def new
      @user = User.new
    end
  
    def create
      created_user = User.new(user_params)
  
      if created_user.save
        flash[:notice] = 'user created successfully.'
        redirect_to users_path(created_user)
      else
        flash[:error] = 'user create unsucessful!'
        @user = created_user
        render :new
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :photo)
    end
end
