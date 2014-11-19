class GoalsController < ApplicationController
  
  def index
    @goal = Goal.new
    @goals = Goal.where(:user_id => current_user)
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
    Goal.update_all({not_done: true}, {:id => params[:goals_ids]})
    redirect_to completed_goals_path
  end
  
  def completed
    @goals = Goal.where(:user_id => current_user)
    @goals_today = @goals.find(:all, :conditions => ["done IS NULL"])
    @goals_yesterday_complete = @goals.where(["done IS NOT NULL AND updated_at >= :date", date: Date.today.to_date])
    @goal = Goal.new
    @goals_incomplete = @goals.find(:all, :conditions => "done IS NULL")
  end
  
  def done
    @goals = Goal.where(:user_id => current_user)
    @goals_incomplete = @goals.find(:all, :conditions => "done IS NULL")
    @goal = Goal.new
  end
  
	def app_params
    params.require(:goal).permit(:title, :done, :not_done)
 	end
 	
end
