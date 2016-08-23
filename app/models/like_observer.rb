class LikeObserver < ActiveRecord::Observer

  def after_save(like)
    Comment.find(params[:comment_id]).increment(:rating, 1)

  end

end
