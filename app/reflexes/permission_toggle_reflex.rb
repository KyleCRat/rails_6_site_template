# frozen_string_literal: true

# WARN: element.data_xyz_id is wrong, but a bug is stopping
#   element.dataset from working...

class PermissionToggleReflex < ApplicationReflex
  def deny
    user = User.find_by(id: element.data_user_id)
    action = PermissiveAction.find_by(id: element.data_action_id)

    user.allowed_actions.destroy(action)
    user.denied_actions << action
  end

  def inherit
    user = User.find_by(id: element.data_user_id)
    action = PermissiveAction.find_by(id: element.data_action_id)

    user.allowed_actions.destroy(action)
    user.denied_actions.destroy(action)
  end

  def permit
    user = User.find_by(id: element.data_user_id)
    action = PermissiveAction.find_by(id: element.data_action_id)

    user.denied_actions.destroy(action)
    user.allowed_actions << action
  end
end
