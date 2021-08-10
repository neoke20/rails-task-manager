class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    params["task"]["completed"] == "1" ? @task.completed = true : @task.completed = false
    # raise
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

end
