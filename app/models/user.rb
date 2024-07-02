class User < ApplicationRecord
  # Include default Devise modules and any others needed
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include Devise::JWT::RevocationStrategies::JTIMatcher

  before_create :generate_jti

  def jwt_payload
    { id: id, jti: jti }
  end

  def jwt_token
    JWT.encode(jwt_payload, Rails.application.credentials[:jwt_secret_key], 'HS256')
  end

  def self.from_token_payload(payload)
    find(payload['id'])
  end

  private

  def generate_jti
    self.jti = SecureRandom.uuid
  end
end
