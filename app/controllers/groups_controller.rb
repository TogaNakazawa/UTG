class GroupsController < ApplicationController
  def create
      @group = Group.find_by(id:params[:id])
      eval(@group.member_names).each do |member_name|
         if params[:confirm]==0
           member.delete
         end

       @group.save
       redirect_to :action=>"show"
     end
  end
  def new
   @group = Group.new
  end

   def group_params
    params.require(:group).permit(:name,:member_names)
   end

  def confirm
    @group = Group.new(name:params[:name],from_id:current_user.id)
    if params[:member_names].present?
    @group.member_names = params[:member_names].split(" ")
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
