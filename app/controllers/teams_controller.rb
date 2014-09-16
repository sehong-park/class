class TeamsController < ApplicationController
  
  def index
    @teams = Team.all
  end
  
  def pickup
#    @users = User.where()
  end
  
end
