# == Schema Information
#
# Table name: deal_options
#
#  id             :integer          not null, primary key
#  deal_id        :integer          not null
#  title          :string           not null
#  details        :text
#  original_price :float
#  deal_price     :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class DealOption < ApplicationRecord
  belongs_to :deal, inverse_of: :options

  validates :title,
            presence: true,
            length: { maximum: 200 }
  validates :original_price, :deal_price,
            numericality: { greater_than: 0 },
            allow_nil: true,
            allow_blank: true

end
