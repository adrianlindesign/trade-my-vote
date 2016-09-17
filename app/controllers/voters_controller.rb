class VotersController < ApplicationController
  def create
    new_voter = Voter.create(
      email: params["email"],
      user_state: params["user_state"],
      desired_candidate: params["desired_candidate"],
      paired: false
    )

    render :thankyou
  end

  def match

    #variables
    swing_states = [
      "AZ",
      "CO",
      "FL",
      "GA",
      "IA",
      "NC",
      "NH",
      "NM",
      "NV",
      "OH",
      "PA",
      "VA",
      "WI"
    ]  
    unpaired_voters = Voter.where(paired: false);

    #arrays 
    voter_pairs = []

    swing_state_3rd_party_voters = []
    solid_state_hillary_voters = []
    
    solid_state_3rd_party_voters = []
    swing_state_hillary_voters = []
    

   
    #push into arrays
    unpaired_voters.each do |voter|

      if swing_states.include?( voter.user_state )
        if voter.desired_candidate == 'hillary'
          swing_state_hillary_voters << voter
        else
          swing_state_3rd_party_voters << voter
        end
      else 
        if voter.desired_candidate == 'hillary'
          solid_state_hillary_voters << voter
        else
          solid_state_3rd_party_voters << voter
        end
      end
    end
      
    binding.pry

    #create pairs ( swing-state-3rd-party + solid-state-hillary)
    swing_state_3rd_party_voters.each do |voter|
      # create pair hash

      # put pair details into hash

      #push hash into voter_pairs array

      #make paired == true && remove from voters arrays (may need to use for loop)
    end

    #send email
    #paired = true;

    redirect_to '/'
  end

  

end