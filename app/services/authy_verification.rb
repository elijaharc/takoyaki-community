class AuthyVerification
    require 'authy'
    require 'dotenv/load'

    Authy.api_key = ENV["AUTHY_API_ID"]
    Authy.api_uri = 'https://api.authy.com'

    def initialize(token, seller_page_id)
        @seller_page = SellerPage.find_by(slug: seller_page_id)
        @verification = Authy::API.verify(:id => @seller_page.authy_id, :token => token)
        if @verification.ok?
            @seller_page.update(verified: true)
        else
            puts @verification.message
            puts "Wrong Token!!!"
        end
    end
end
