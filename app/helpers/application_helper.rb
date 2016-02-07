module ApplicationHelper
  def label_or_error(object, field, label)
    label_error(object, field, label) { object.errors.get(field)[0] }
  end

  def label_or_full_error(object, field, label)
    label_error(object, field, label) { object.errors.full_messages_for(field)[0] }
  end

  def error_class(object, field)
    'has-error' if has_error object, field
  end

  private

  def has_error(object, field)
    object.errors[field].count > 0
  end

  def label_error(object, field, label)
    if has_error object, field
      yield(object, field)
    else
      label
    end
  end
end
