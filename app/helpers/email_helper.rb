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
      
        mg_client.send_message mgn_domain, message_params
    end
    
    def self.email_matches(swing_3p, solid_hillary)
        EmailHelper.send_email({
            # to should be the email for each candidate I believe
            # :to         => "#{swing_3p.email}, #{solid_hillary.email}"
            :to         => "{your_mailgun_registration_email}",
            :subject    => "Thank you for trading votes!",
            :html       => get_email_html(swing_3p, solid_hillary)
        })
    end 

    def self.get_email_html(swing_3p, solid_hillary)
        return "<h1>Thank you for trading your vote</h1>" \
               "<p>Solid State Voter: #{swing_3p.email} (#{swing_3p.user_state} - #{swing_3p.desired_candidate})</p>"\
               "<p>- will be trading votes with -"\
               "<p>Solid State Voter: #{solid_hillary.email} (#{solid_hillary.user_state} - #{solid_hillary.desired_candidate})</p>"
    end
end    