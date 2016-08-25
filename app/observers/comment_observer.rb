class CommentObserver < ActiveRecord::Observer

  def after_create(comment)
    comment.post.increment(:rating, 3)
    comment.post.save
  end

  def after_destroy(comment)
    comment.post.decrement(:rating, 3)
    comment.post.save
  end

end
