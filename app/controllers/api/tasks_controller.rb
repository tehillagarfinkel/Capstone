class Api::TasksController < ApplicationController
  def index
    @tasks = Task.all
    render "index.json.jb"
  end

  def show
    @task = Task.find_by(id: params[:id])
    render "show.json.jb"
  end
end
