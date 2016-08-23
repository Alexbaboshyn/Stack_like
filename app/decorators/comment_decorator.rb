class CommentDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    {
      id: id,
      author: user.decorate,
      text: text,
      rating: rating
    }
  end
end
