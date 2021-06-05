class AuthyRequest
    require 'authy'
    require 'dotenv/load'

    Authy.api_key = ENV["AUTHY_API_ID"]
    Authy.api_uri = 'https://api.authy.com'

    def initialize(authy_id)
        @response = Authy::API.request_sms(:id => authy_id, :force => true)
        puts @response.message
    end
end
