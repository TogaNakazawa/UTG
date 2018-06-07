class PostsController < ApplicationController

  before_action :authenticate_user!
def show

end
  def index
    @posts = Post.all
  end
  def new

  end


  def create
    @post = Post.create(user_id:current_user.id, group_id:params[:group_id],body:params[:body])
    redirect_to group_path(id:@post.group_id)
  end

#セキュリティのため、許可した:bodyというデータだけ取ってくるようにする
#def posts_params
  #params.require(:post).permit(:body)
#end
end
