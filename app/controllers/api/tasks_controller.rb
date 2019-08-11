class Api::TasksController < ApplicationController
  before_action :authenticate_user

  def show
    @task = Task.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    @task = Task.new(
      category_id: params[:category_id],
      description: params[:description],
      start: params[:start],
      duration: params[:duration],
      due_date: params[:due_date],
    )
    @task.save
    render "show.json.jb"
  end

  def update
    @task = Task.find_by(id: params[:id])
    @task.description = params[:description] || @task.description
    @task.category_id = params[:category_id] || @task.category_id
    @task.completed = params[:completed] || @task.completed
    @task.start = params[:start] || @task.start
    @task.duration = params[:duration] || @task.duration
    @task.due_date = params[:due_date] || @task.due_date

    @task.save
    render "show.json.jb"
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    render json: { message: "Task successfully deleted" }
  end
end
