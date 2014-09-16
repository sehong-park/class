class TeamsController < ApplicationController
  before_action :admin_user, only: [:edit, :update, :pickup, :destroy]
  
  def index
    @users = User.where(team_id: nil)
    @teams = Team.all
  end
  
  def pickup
    @users = User.where(team_id: nil)
    index = Random.rand(@users.count)
    @pickup_user = @users[index]
    
    @teams = Team.all
    
    @teams.each_with_index do |team, index|
      @pickup_team = team if team.users.count < 4
    end
    
    @pickup_user.team_id = @pickup_team.id
    @pickup_user.save!
    
    render 'teams/index'
  end
  
end
