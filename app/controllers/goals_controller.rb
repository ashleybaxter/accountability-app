class GoalsController < ApplicationController
  
  def index
    @goals = Goal.where(:user_id => current_user)
    @goal = Goal.new
    @goals_done = @goals.find(:all, :conditions => "done")
    @goals_incomplete = @goals.find(:all, :conditions => "done IS NULL")
  end
  
  def new
    @goals = Goal.where(:user_id => current_user)
    @goal = Goal.new
    @goals_incomplete = @goals.find(:all, :conditions => "done IS NULL")
  end
  
  def create
    @goal = Goal.new(app_params)
    @goal.user = current_user
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
    Goal.update_all({done: true, :updated_at => Time.now}, {:id => params[:goal_ids]})
    redirect_to today_goals_path
  end
  
  def tomorrow
    @goals = Goal.where(:user_id => current_user)
    @goals_incomplete = @goals.find(:all, :conditions => "done IS NULL")
  end
  
  def today
    @goals = Goal.where(:user_id => current_user)
    @goals_today = @goals.find(:all, :conditions => ["done IS NULL"])
    @goals_yesterday_complete = @goals.where(["done IS NOT NULL AND updated_at >= :date", date: Date.today.to_date])
    @goal = Goal.new
    @goals_incomplete = @goals.find(:all, :conditions => "done IS NULL")
  end
  
	def app_params
    params.require(:goal).permit(:title, :done)
 	end
 	
end
