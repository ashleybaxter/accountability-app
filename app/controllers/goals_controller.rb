class GoalsController < ApplicationController
  def index
    @goals = Goal.all
    @goal = Goal.new
  end
  
  def new
    @goal = Goal.new
  end
  
  def create
    @goal = Goal.new(app_params)
		if @goal.save
   			redirect_to goals_path
  		else
    		render('new')
  		end
  end
  
	def app_params
    params.require(:goal).permit(:title)
 	end
 	
end
