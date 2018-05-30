class UsersController < ApplicationController

  def show
    @user=User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = current_user
  end

  def user_params
   params.require(:user).permit(:name, :community_list, :skill_list, :interest_list)
  end

  def update
    @user = current_user

    if params[:name].present?
      @user.name = params[:name]
    end

    if params[:image].present?
      random = rand(1..10000)
      @user.image_name = "#{random}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if params[:community_list].present?
      @user.community_name=params[:community_list]
    end

    if params[:interest_list].present?
      @user.interest_name=[:interest_list]
    end

    if params[:skill_list].present?
      @user.skill_name=[:skill_list]
    end

    @user.save
    redirect_to :action => "show"
  end
end
