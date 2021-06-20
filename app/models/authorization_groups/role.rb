# == Schema Information
#
# Table name: permission_groups
#
#  id    :bigint           not null, primary key
#  title :string
#  type  :string
#

class Role < PermissionGroup
end
