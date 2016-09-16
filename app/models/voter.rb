class Voter < ActiveRecord::Base
  validates(:email, {uniqueness: true} )
end