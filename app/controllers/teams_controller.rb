class TeamsController < ApplicationController
  before_action :admin_user, except: [:index]
  
  def index
    @users = User.where({team_id: nil, admin: false})
    @teams = Team.all
  end

  def pickup
    @users = User.where({team_id: nil, admin: false})
    @teams = Team.all

    times = (@users.count > 10) ? 10 : @users.count

    for i in 0...times
      @pickup_user = @users[Random.rand(@users.count)]
      @pickup_team = @teams[Random.rand(@teams.count)]

      for i in 0..@pickup_team.users.count
        break if @pickup_team.users.count < 3        
        @pickup_team = @teams[Random.rand(@teams.count)]
      end
      
      if @pickup_team.users.count >= 3
        small_team_index = 0
        @teams.each_with_index do |team, index|
          small_team_index = (team.users.count <= @teams[small_team_index].users.count) ? index : small_team_index
        end
        @pickup_team = @teams[small_team_index]
      end

      @pickup_user.update_attributes(team_id: @pickup_team.id)
      @users = User.where({team_id: nil, admin: false})
    end

    render 'teams/index'
  end
  
  def reset
    @users = User.where.not(team_id: nil)
    @users.each do |user|
      user.update(team_id: nil)
    end
    redirect_to teams_path
  end
  
end
