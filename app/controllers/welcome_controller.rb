class WelcomeController < ApplicationController
  def index
    @courses = Course.all
  end
  
  def feedback
  end
end
