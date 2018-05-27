class UsersController < ApplicationController


  def show
   @user = current_user

  end
  def edit
    @user = current_user
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
    @user.save
  redirect_back(fallback_location: user_path)
  end

end
