class VotersController < ApplicationController
  def create
    new_voter = Voter.create(
      email: params["email"],
      user_state: params["user_state"],
      candidate: params["candidate"]
    )
  end

  def match
    #match the voters
  end

  
end