require 'net/http'

class Api::V1::ExternalServicesController < Api::V1::BaseController
  before_action :log_headers
  before_action :authenticate_user!

  def fetch_data
    # Specify the log file path
    File.open('log/fetch_error.log', 'a') {|f| f.puts "Headers: #{request.headers.inspect} #{Time.now.strftime("%Y-%m-%d %H:%M:%S")}"}

    # Perform your API call or other actions here
    uri = URI('https://random.dog/woof.json')
    response = Net::HTTP.get(uri)

    render json: response
  end

  private
  def log_headers
    authorization_header = request.headers['Authorization']
    File.open('log/headers.log', 'a') do |f|
      f.puts "Headers: #{request.headers.inspect} #{Time.now.strftime("%Y-%m-%d %H:%M:%S")}"
      f.puts "Authorization Header: #{authorization_header}"
    end
  end
end
