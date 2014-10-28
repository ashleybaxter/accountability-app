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
   			redirect_to :back
  	end
  end
  
  def destroy
    @goal = Goal.find(params[:id])
		@goal.destroy

		redirect_to root_path
  end
  
  def complete
    Goal.update_all({done: true}, {:id => params[:goal_ids]})
    redirect_to today_goals_path
  end
  
  def tomorrow
    @goals_incomplete = Goal.find(:all, :conditions => "done IS NULL")
  end
  
  def today
    @goals_today = Goal.find(:all, :conditions => ["done IS NULL"])
    @goals_yesterday_complete = Goal.where(["done IS NOT NULL AND updated_at >= :date", date: Date.today.to_date]).all
    @goal = Goal.new
  end
  
	def app_params
    params.require(:goal).permit(:title, :done)
 	end
 	
end
