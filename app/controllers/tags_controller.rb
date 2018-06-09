class TagsController < ApplicationController
  def index

  end
  def show
    @user=User.find(params[:user_id])
    @tag=ActsAsTaggableOn::Tag.find(params[:id])
  end
end
