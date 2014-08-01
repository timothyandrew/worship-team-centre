class UserDecorator < Draper::Decorator
  delegate_all

  def availability_icon(date, service)
    if user.is_available?(date, service)
      "✓"
    else
      ""
    end
  end

end
