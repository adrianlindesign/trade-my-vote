require 'mailgun'
module EmailHelper

    def self.send_email(message_params) 
        api_key     = ENV['tmv-api_key']
        mgn_from    = ENV['tmv-mgn_from']
        mgn_domain  = ENV['tmv-mgn_domain']
        
        mg_client = Mailgun::Client.new api_key
        
        # User the default from if not provided 
        if message_params[:from] == nil 
            message_params[:from] = mgn_from
        end 
      
        #mg_client.send_message mgn_domain, message_params
    end
    
    def self.email_matches(swing_3p, solid_hillary)
        puts "sending message to #{swing_3p.email}, #{solid_hillary.email}"
    end 
end    