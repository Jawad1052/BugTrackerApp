class BugsController < ApplicationController
  load_and_authorize_resource
   #before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @bugs = Bug.all
  end
  def new
    @bug = Bug.new
  end
  def create
    @bug = Bug.new(bug_params)
    @bug.status = "To Do"
    if @bug.save
      redirect_to @bug, notice: 'Bug was successfully created.'
    else
      render :new
    end
  end
  def show
    @bug = Bug.find(params[:id])
    @comments = @bug.comments
  end
  def destroy
    if current_user.role.name == 'admin'
    @bug = Bug.find(params[:id])
    if @bug.destroy
      render json: { success: true, message: 'Bug was successfully deleted.' }
      # redirect_to bugs_path, alert: 'Bug was successfully deleted.'
    else
      redirect_to @bug, alert: 'Failed to delete bug.'
    end
    end
  end

  def delete_bug
    if current_user.role.name == 'admin'
      @bug = Bug.find(params[:id])
      if @bug.destroy
        render json: { success: true, message: 'Bug was successfully deleted.' }
      else
        render json: { success: false, message: 'Bug was not deleted' }
      end
    end
  end

  def edit
    @bug = Bug.find(params[:id])
  end
  def update
    @bug = Bug.find(params[:id])
    if @bug.update(bug_params)
      redirect_to bugs_path
    else
      render :edit
    end
  end

  def assign_bug
    @bug = Bug.find(params[:id])
    bug_user_id = params[:bug][:user_id].to_i
    if current_user.role.name == 'manager'
      @bug.update(user_id: bug_user_id)
      redirect_to bugs_path
    elsif current_user.id == bug_user_id
      @bug.update(user_id: current_user.id)
      redirect_to bugs_path
    else
      redirect_to @bug, alert: "You can only assign bug to yourself."
    end
  end
  private

  def bug_params
    params.require(:bug).permit(:title, :description, :priority, :status)
  end
  def bug_params_update
    params.require(:bug).permit(:title, :description, :priority, :status, :user_id)
  end
end
