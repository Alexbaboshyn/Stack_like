class CommentDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    {
      id: id,
      author: User.where(id: user_id).decorate,
      text: text,
      rating: rating
    }
  end
end
