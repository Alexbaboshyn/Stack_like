class PostDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    {
      id: id,
      title: title,
      description: description,
      rating: rating,
      author: User.where(id: author_id).decorate
    }
  end
end
