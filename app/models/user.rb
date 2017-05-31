# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  photo                  :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  location               :string
#  industry               :string
#  phone                  :string
#  description            :string
#  linkedin_url           :string
#  twitter_url            :string
#  facebook_url           :string
#  google_plus_url        :string
#  is_admin               :boolean          default(FALSE)
#

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable

  mount_uploader :photo, UserPhotoUploader

  has_many :authorizations, dependent: :destroy

  validates_presence_of :first_name
  validates_length_of :first_name, :last_name,
                      minimum: 1,
                      maximum: 25,
                      allow_blank: true,
                      allow_nil: true

  def self.find_or_create_from_omniauth(auth)
    authorization = Authorization.find_or_initialize_by(
      provider: auth.provider,
      uid: auth.uid.to_s
    )
    auth_info = auth.info

    if authorization.persisted?
      authorization.user
    else
      user = User.find_by(email: auth.info.email)
      if user.nil?
        first_name = auth_info.first_name.presence || auth_info.name.presence ||
            auth_info.nickname.presence

        user = User.new(
          first_name: first_name,
          last_name: auth_info.last_name,
          email: auth_info.email,
          password: Devise.friendly_token[0, 10]
        )
      end

      extra_info = {}
      # Store or update extra information
      %i(phone location description industry).each do |attr|
        unless user.send(attr).present?
          extra_info[attr] = auth_info[attr]
        end
      end

      # Store public profile urls
      case auth.provider
        when 'facebook'
          extra_info[:facebook_url] = "https://facebook.com/#{auth.uid}"
        when 'linkedin'
          extra_info[:linkedin_url] = auth_info.urls.public_profile
        when 'google_oauth2'
          extra_info[:google_plus_url] = auth.info.urls.Google
        when 'twitter'
          extra_info[:twitter_url] = auth_info.urls.Twitter
      end

      user.assign_attributes(extra_info)
      user.save(validate: false)

      authorization.user_id = user.id
      authorization.save(validate: false)
      user
    end
  end
end
