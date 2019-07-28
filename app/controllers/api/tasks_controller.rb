class Api::TasksController < ApplicationController
  def index
    @tasks = Task.all
    render "index.json.jb"
  end

  def create
    @task = Task.new(
      description: params[:description],
      user_id: current_user.id,
      category_id: params[:category_id],
      start: params[:start],
      duration: params[:duration],
      due_date: params[:due_date],
    )
    @task.save
    render "show.json.jb"
  end

  def show
    @task = Task.find_by(id: params[:id])
    render "show.json.jb"
  end
end
