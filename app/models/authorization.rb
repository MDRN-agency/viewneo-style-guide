# == Schema Information
#
# Table name: authorizations
#
#  id         :integer          not null, primary key
#  provider   :string           not null
#  uid        :string           not null
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Authorization < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :uid, scope: :provider
end
