class UsersController < ApplicationController

  def show
    @user=User.find(params[:id])
    @user.university_list.add "Todai"
    @user.save
    @groups=@user.groups
  end

  def index
    @users = User.all
  end

  def edit
    @user = current_user
  end

  def user_params
   params.require(:user).permit(:name, :community_list, :skill_list, :interest_list, :university_list)
  end


  def update
    @user = current_user

    if params[:name].present?
      @user.name = params[:name]
    end

    if params[:image].present?
      image = params[:image]
      random = rand(1..10000)
      @user.image_name = "#{random}.jpg"
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if params[:cover_image].present?
      random = rand(1..10000)
      cover = params[:cover_image]
      @user.image_cover_name = "#{random}.jpg"
      File.binwrite("public/user_cover_photos/#{@user.image_cover_name}", cover.read)
    end


    if params[:community_list].present?
      @user.community_list=params[:community_list]
    end

    if params[:interest_list].present?
      @user.interest_list=params[:interest_list]
    end

    if params[:skill_list].present?
      @user.skill_list=params[:skill_list]

    end

    @user.save
    redirect_to :action => "show"
  end
end
