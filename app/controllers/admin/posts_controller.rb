class Admin::PostsController < BaseController

  def destroy
    resource.update_attribute(:is_deleted, 'true')
    resource.save!
  end

  private

  def resource
    @post = Post.find params[:id]
  end

  def collection
    @posts = Post.visible.page(params[:page]).per(5)
  end

  def resource_params
    params.require(:post).permit(:title, :description, :deleted)
  end
end
