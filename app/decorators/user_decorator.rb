class UserDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    {
      id: id,
      full_name: first_name + ' ' + last_name,
      email: email
    }
  end
end
