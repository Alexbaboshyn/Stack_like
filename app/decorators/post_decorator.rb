class PostDecorator < Draper::Decorator
  delegate_all
  decorates_association :author

  def as_json *args
    if context[:show_comments]
     {
        id: id,
        title: title,
        description: description,
        rating: rating,
        author: author,
        comments: comments.decorate
      }

    else
      {
        id: id,
        title: title,
        description: description,
        rating: rating,
        author: author
      }
    end
  end
end
