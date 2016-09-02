class CommentObserver < ActiveRecord::Observer

  def after_create(comment)
    comment.post.increment!(:rating, Comment::COMMENT_CONSTANT)
  end

  def after_destroy(comment)
    comment.post.decrement!(:rating, Comment::COMMENT_CONSTANT)
  end

end
