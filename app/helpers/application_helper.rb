module ApplicationHelper
  # helper method for defining page titles
  def full_screen(full_screen = false)
    return unless full_screen

    content_for :full_screen, 'fluid'
  end

  # helper method for defining page titles
  def title(title = nil)
    if title.present? && !Rails.configuration.default_meta_title.blank?
      content_for :title, title + ' | ' + Rails.configuration.default_meta_title
    elsif title.present?
      content_for :title, title
    else
      content_for :title, Rails.configuration.default_meta_title
    end

    if title.present?
      content_for :interior_title, title
    else
      content_for :interior_title, "set - title = 'asdf' on page"
    end
  end

  # helper method for defining meta descriptions
  def meta_description(desc = nil)
    if desc.present?
      content_for :meta_description, desc
    elsif content_for?(:meta_description)
      content_for :meta_description
    else
      Rails.configuration.default_meta_description
    end
  end

  def body_controller_action_class_name
    "#{controller_path.parameterize}_#{action_name}"
  end
end
