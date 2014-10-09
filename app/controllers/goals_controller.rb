class GoalsController < ApplicationController
  def index
    @goals = Goal.all
    @goal = Goal.new
    @goals_done = Goal.find(:all, :conditions => "done")
    @goals_incomplete = Goal.find(:all, :conditions => "done IS NULL")
  end
  
  def new
    @goal = Goal.new
    @goals_incomplete = Goal.find(:all, :conditions => "done IS NULL")
  end
  
  def create
    @goal = Goal.new(app_params)
		if @goal.save
   			redirect_to goals_path
  		else
    		render('new')
  		end
  end
  
  def update
    @goal = Goal.find(params[:id])
      if @goal.update_attributes(app_params)
        redirect_to(goals_path)
      end
  end
  
  def complete
    Goal.update_all({done: true}, {:id => params[:goal_ids]})
    redirect_to goals_path
  end
  
	def app_params
    params.require(:goal).permit(:title, :done)
 	end
 	
end
