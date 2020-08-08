module Admin::Permissions::UsersHelper
  def render_permission_toggle(user, action)
    identifier = "#{action.klass.parameterize}-#{action.action.parameterize}"

    group_permitted = user.authorized?(action) ? 'group-permitted' : nil

    denied =
      content_tag(
        :input,
        nil,
        type: :radio,
        name: identifier,
        checked: user.denied_actions.include?(action),
        id: "#{identifier}-denied",
        data: { reflex: 'change->PermissionToggleReflex#deny',
                user_id: user.id,
                action_id: action.id } ) +
      content_tag(:label, nil, for: "#{identifier}-denied")

    inherited =
      content_tag(
        :input,
        nil,
        type: :radio,
        name: identifier,
        checked: !user.overrided_actions.include?(action),
        id: "#{identifier}-inherited",
        data: { reflex: 'change->PermissionToggleReflex#inherit',
                user_id: user.id,
                action_id: action.id } ) +
      content_tag(:label, nil, for: "#{identifier}-inherited")

    permitted =
      content_tag(
        :input,
        nil,
        type: :radio,
        name: identifier,
        checked: user.allowed_actions.include?(action),
        id: "#{identifier}-permitted",
        data: { reflex: 'change->PermissionToggleReflex#permit',
                user_id: user.id,
                action_id: action.id } ) +
      content_tag(:label, nil, for: "#{identifier}-permitted")

    permission_classes =
      if user.allowed_actions.include?(action)
        'permitted'
      elsif user.denied_actions.include?(action)
        'denied'
      else
        'inherited'
      end

    content_tag(:div, class: ['permission-toggle', group_permitted, permission_classes, identifier], data: { controller: 'permission-toggle', target: 'permission-toggle.toggle', 'reflex-root': ".#{identifier}" }) do
      denied +
      inherited +
      permitted +
      content_tag(:div, nil, class: :background) +
      content_tag(:label, for: "#{identifier}-inherited", class: :paddle) do
        inline_svg_tag('shared/check.svg', class: 'true') +
        inline_svg_tag('shared/close.svg', class: 'false')
      end
    end
  end
end
