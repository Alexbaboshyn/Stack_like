class LikeObserver < ActiveRecord::Observer

  def after_save(like)
    likeable.increment(:rating, 1)
    likeable.save
  end


end
