class GroupsController < ApplicationController
  def create
      @group = Group.find(params[:id])
      @group.member_names.split(",").each do |member_name|
           if params[:confirm]==0
             member_name.delete
           end
      @group.save
        hoge=User.find_by(name:member_name)
        GroupUser.create(group_id:@group.id, user_id:hoge.id)
     end
     redirect_to group_path(id:@group.id)
  end

  def new
   @group = Group.new
  end
  def show
    @group = Group.find_by(id:params[:id])
    @posts = Post.where(group_id:@group.id)
  end

   def group_params
    params.require(:group).permit(:name,:member_names)
   end

  def confirm
    @t=params[:member_names].split
    u=@t.join","
    s=u+",#{current_user.name}"
    if params[:member_names].present?
     @group = Group.create(name:params[:name],from_id:current_user.id,member_names:s)
    end
  end

  def interrupt
    @group = Group.find_by(from_id:params[:from_id], to_id:params[:to_id])
    @group.delete
    redirect_back(fallback_location: root_path)
  end

  def accept
    @group = Group.find_by(from_id:params[:from_id], to_id:params[:to_id])
    @group.approved = true
    @group.save
    redirect_back(fallback_location: root_path)
  end
end
