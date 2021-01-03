class TwilioClient
    attr_reader :client
    def initialize
        Twilio.configure do |config|
            config.account_sid = 'AC7345dfc46128693a57479862ec8b23bc' 
            config.auth_token = '1b8e39f5baafa6e98c76fe2aed35923b'
        end
        @client = Twilio::REST::Client.new   
    end
    def send_text( phone, message)
        @client.messages.create(
            to: phone,
            from: '+12513060754',
            body: message
        )
    end
end
