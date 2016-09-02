class LikeObserver < ActiveRecord::Observer

  attr_reader :like, :coef


  def after_create(like)
    @coef = 1
    @like = like
    add_rating
  end

  def after_destroy(like)
    @coef = -1
    @like = like
    add_rating
  end

  def add_rating
    add_rating_to_post_and_author
    add_rating_to_comment_and_user if like.likeable.is_a?(Comment)
  end

  def add_rating_to_post_and_author
    post.increment!(:rating, rating_value)
    post.author.increment!(:rating, rating_value)
  end

  def add_rating_to_comment_and_user
    like.likeable.increment!(:rating, rating_value)
    like.likeable.user.increment!(:rating, rating_value)
  end

  def post
    @post = \
    if like.likeable.is_a?(Comment)
      like.likeable.post
    else
      like.likeable
    end
  end


  def rating_value
    @rating_value =\
    if like.positive?
      coef * Like::POSITIVE_VALUE
    else
      coef * Like::NEGATIVE_VALUE
    end
  end

end
#
#
# # def after_create(like)
# #   @like = like
# #   like.likeable.increment!(:rating, rating_value)
#   if like.likeable.is_a?(Comment)
#     like.likeable.user.increment!(:rating, rating_value)
#     like.likeable.post.increment!(:rating, rating_value)
#   else
#     like.likeable.author.increment!(:rating, rating_value)
#   end
# end

# def after_destroy(like)
#   @like = like
#   like.likeable.decrement!(:rating, rating_value)
#   if like.likeable.is_a?(Comment)
#     like.likeable.user.decrement!(:rating, rating_value)
#     like.likeable.post.decrement!(:rating, rating_value)
#   else
#     like.likeable.author.decrement!(:rating, rating_value)
#   end
# end
