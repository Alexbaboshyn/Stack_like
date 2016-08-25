class LikeObserver < ActiveRecord::Observer

  def after_create(like)
    if like.kind == "positive"
      like.likeable.increment(:rating, 1)
      if like.likeable.is_a?(Comment)
        like.likeable.user.increment(:rating, 1)
        like.likeable.user.save
        like.likeable.post.increment(:rating, 1)
        like.likeable.post.save
      else
        like.likeable.author.increment(:rating, 1)
        like.likeable.author.save
      end
    else
      like.likeable.decrement(:rating, 1)
      if like.likeable.is_a?(Comment)
        like.likeable.user.decrement(:rating, 1)
        like.likeable.user.save
        like.likeable.post.increment(:rating, 1)
        like.likeable.post.save
      else
        like.likeable.author.decrement(:rating, 1)
        like.likeable.author.save
      end
    end
    like.likeable.save
  end


  def after_destroy(like)
    if like.kind == "positive"
      like.likeable.decrement(:rating, 1)
      if like.likeable.is_a?(Comment)
        like.likeable.user.decrement(:rating, 1)
        like.likeable.user.save
        like.likeable.post.decrement(:rating, 1)
        like.likeable.post.save
      else
        like.likeable.author.decrement(:rating, 1)
        like.likeable.author.save
      end
    else
      like.likeable.increment(:rating, 1)
      if like.likeable.is_a?(Comment)
        like.likeable.user.increment(:rating, 1)
        like.likeable.user.save
        like.likeable.post.decrement(:rating, 1)
        like.likeable.post.save
      else
        like.likeable.author.increment(:rating, 1)
        like.likeable.author.save
      end
    end
    like.likeable.save
  end

end
