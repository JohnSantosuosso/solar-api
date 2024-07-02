class User < ApplicationRecord
  # Include default Devise modules and any others needed
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include Devise::JWT::RevocationStrategies::JTIMatcher

  def jwt_payload
    { id: id }
  end

  def jwt_token
    JWT.encode(jwt_payload, Rails.application.credentials.dig(:devise, :jwt_secret_key), 'HS256')
  end
end
