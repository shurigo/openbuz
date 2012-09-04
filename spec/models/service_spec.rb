# == Schema Information
#
# Table name: services
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  provider   :string(255)
#  uid        :string(255)
#  uname      :string(255)
#  uemail     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Service do
  pending "add some examples to (or delete) #{__FILE__}"
end
