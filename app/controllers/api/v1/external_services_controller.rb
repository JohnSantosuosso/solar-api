class Api::V1::ExternalServicesController < Api::V1::BaseController
  before_action :authenticate_user!

  def fetch_data
    # Specify the log file path
    File.open('log/fetch_error.log', 'a') {|f| f.puts "Headers: #{request.headers.inspect} #{Time.now.strftime("%Y-%m-%d %H:%M:%S")}"}

    # Perform your API call or other actions here
    uri = URI('https://random.dog/woof.json')
    response = Net::HTTP.get(uri)
  end
end
