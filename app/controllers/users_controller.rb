class UsersController < ApplicationController
    before_action :set_user_params, only: %i[show edit destroy]
  
    def index
      @users = User.all
    end
  
    def show
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
        flash[:error] = 'group create unsucessful!'
        @user = created_user
        render :new
      end
    end
  
    def destroy
      @user.destroy
      redirect_to users_path(@user), notice: "Successfully deleted #{@user.name}."
    end

    private
  
    def set_user_params
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :photo)
    end
end
  
