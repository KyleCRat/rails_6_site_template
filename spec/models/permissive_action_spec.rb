# == Schema Information
#
# Table name: permissive_actions
#
#  id         :bigint           not null, primary key
#  klass      :string
#  action     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe PermissiveAction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
