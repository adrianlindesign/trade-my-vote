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

    swing_3P_voters = []
    solid_hillary_voters = []
    
    solid_3P_voters = [] #not really useful
    swing_hillary_voters = [] #not really useful
    

   
    #sort voter types into arrays
    unpaired_voters.each do |voter|

      if swing_states.include?( voter.user_state )
        if voter.desired_candidate == 'hillary'
          swing_hillary_voters << voter
        else
          swing_3P_voters << voter
        end
      else 
        if voter.desired_candidate == 'hillary'
          solid_hillary_voters << voter
        else
          solid_3P_voters << voter
        end
      end
    end
      


    # create pair hash of 3rd party in swing state and hillary in solid state
    i = 0
    while i < swing_3P_voters.length && solid_hillary_voters[i] != nil
      
      #make paired == true 
      swing_3P_voters[i].update(paired: true)
      solid_hillary_voters[i].update(paired: true)

      # put pair details into hash
      pair = {}
      pair[:swing_voter] = swing_3P_voters[i].as_json
      pair[:solid_voter] = solid_hillary_voters[i].as_json 
      voter_pairs << pair

      i += 1
    end

    #now send off emails( voter_pairs, swing_hillary_voters, solid_3P_voters)
    binding.pry

    #for voter_pairs, send them email:





    redirect_to '/'
  end

 

end