class AuthyRegistration
    require 'authy'
    require 'dotenv/load'

    Authy.api_key = ENV["AUTHY_API_ID"]
    Authy.api_uri = 'https://api.authy.com'

    def initialize(user_id, phone_number)
        @user = User.find(user_id)
        @authy = Authy::API.register_user(:email => @user.email, :cellphone => phone_number, :country_code => "63")
        if @authy.ok?
            @user.seller_page.update(authy_id: @authy.id)
            @user.save!
        else
            puts @authy.errors
        end
    end
end