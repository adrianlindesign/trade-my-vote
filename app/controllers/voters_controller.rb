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
    #match the voters
    #check if there are any unpaired ones
  end


end