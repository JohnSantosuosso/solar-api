class Api::V1::ExternalServicesController < Api::V1::BaseController
  require 'net/http'

  def fetch_data
    uri = URI('https://random.dog/woof.json')
    response = Net::HTTP.get(uri)
    render json: JSON.parse(response)
  end
end