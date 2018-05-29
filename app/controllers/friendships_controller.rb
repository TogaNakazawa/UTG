class FriendshipsController < ApplicationController
  def create
    @friends = Friendship.create(from_id:params[:from_id], to_id:params[:to_id])
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @friend = Friendship.find_by(from_id:params[:from_id], to_id:params[:to_id])
    @friend.delete
    redirect_back(fallback_location: root_path)
  end

  def accept
    @friend = Friendship.find_by(from_id:params[:from_id], to_id:params[:to_id])
    @friend.approved = true
    @friend.save
    redirect_back(fallback_location: root_path)
  end

  def from_block
    @friend = Friendship.find_by(from_id:params[:from_id], to_id:params[:to_id])
    @friend.from_blocked = true
    @friend.save
    redirect_back(fallback_location: root_path)
  end

  def to_block
    @friend = Friendship.find_by(from_id:params[:from_id], to_id:params[:to_id])
    @friend.to_blocked = true
    @friend.save
    redirect_back(fallback_location: root_path)
  end

  def from_unblock
    @friend = Friendship.find_by(from_id:params[:from_id], to_id:params[:to_id])
    @friend.from_blocked = false
    @friend.save
    redirect_back(fallback_location: root_path)
  end

  def to_unblock
    @friend = Friendship.find_by(from_id:params[:from_id], to_id:params[:to_id])
    @friend.to_blocked = false
    @friend.save
    redirect_back(fallback_location: root_path)
  end
end
