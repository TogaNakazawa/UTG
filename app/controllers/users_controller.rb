class UsersController < ApplicationController

  def show
   @user = current_user

  end
  def edit
    @user = current_user
  end
  def user_params
   params.require(:user).permit(:name, :community_list, :skill_list, :interest_list)
  end
  def update
    @user = current_user

    if params[:name]!=nil
      @user.name = params[:name]
    end
    if params[:image]!=nil
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
    if params[:community_list]!=nil
      @user.community_name=params[:community_list]
    end
    if params[:interest_list]!=nil
      @user.interest_name=[:interest_list]
    end
    if params[:skill_list]!=nil
      @user.skill_name=[:skill_list]
    end
    @user.save
    redirect_back(fallback_location: user_path, method: :get)
  end
end
