class GroupsController < ApplicationController
  def create
      @group = Group.find_by(from_id:current_user.id)
      @group.member_names = @group.member_names.split(" ")
      eval(@group.member_names).each do |member_name|
         if params[:confirm]==0
           member_name.delete
         end
       @group.save
       @group = Group.find_by(from_id:current_user.id)
     end
     redirect_to group_path(id:@group.id)
  end

  def new
   @group = Group.new
  end
  def show
    @group = Group.find_by(id:params[:id])
  end

   def group_params
    params.require(:group).permit(:name,:member_names)
   end

  def confirm
    @group = Group.new(name:params[:name],from_id:current_user.id,member_names:params[:member_names])
    if params[:member_names].present?
    @group.save
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
