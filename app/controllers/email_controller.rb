require 'email_helper'

class EmailController < ApplicationController

    def test
        @email = params["email"]
        @voting_for = params["voting_for"]
        
        # send_simple_message(email, voting_for)    
        render :test_result
    end
    
    
    def send_simple_message(email, voting_for)
        EmailHelper.send_email({
            :to         => "joseph.schmo@gmail.com",
            :subject    => "Thank you for agreeing to swap  votes",
            :html       => "<h1>Thank you #{email}!!</h1><p>Your vote for #{voting_for} has been swapped</p>"
        })
    end
end