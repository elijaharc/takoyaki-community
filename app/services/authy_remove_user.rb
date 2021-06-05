class AuthyRemoveUser
    require 'authy'
    require 'dotenv/load'

    Authy.api_key = ENV["AUTHY_API_ID"]
    Authy.api_uri = 'https://api.authy.com'

    def initialize(user_id)
        @user = User.find(user_id)
        @response = Authy::API.delete_user(:id => @user.seller_page.authy_id)
        if @response.ok?
            @user.seller_page.update(authy_id: nil)
            @user.save!
        else
            puts @response.errors
        end
    end
end