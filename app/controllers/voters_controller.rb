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

    #arrays 
    voter_pairs = []
    
    swing_3P_voters         = Voter.where(paired: false, 
                                          user_state: swing_states)
                                   .where.not(desired_candidate: "hillary" )
                                   .to_a

    solid_hillary_voters    = Voter.where(paired: false,
                                          desired_candidate: "hillary")
                                   .where.not(user_state: swing_states)
                                   .to_a
                                
    # Just used on the testing page                                
    @swing_3P_voters = swing_3P_voters
    @solid_hillary_voters = solid_hillary_voters                                                                     
   
    # create pair hash of 3rd party in swing state and hillary in solid state
    i = 0
    while i < swing_3P_voters.length && solid_hillary_voters[i] != nil
       
      # Do the match, append the result to this array which is not used
      match = match_voters(swing_3P_voters[i], solid_hillary_voters[i])
      voter_pairs << match

      i += 1
    end

    #now send off emails( voter_pairs, swing_hillary_voters, solid_3P_voters)
    #binding.pry

    #for voter_pairs, send them email:

    render :match
  end

  def match_voters(swing_3p, solid_hillary)
      do_update = true

      #make paired == true 
      if do_update
        swing_3p.update(paired: true)
        solid_hillary.update(paired: true)
      end 
      
      # put pair details into hash
      pair = {}
      pair[:swing_voter] = swing_3p.as_json
      pair[:solid_voter] = solid_hillary.as_json  
      
      return pair
  end

end