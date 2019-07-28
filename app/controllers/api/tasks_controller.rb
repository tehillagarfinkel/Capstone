class Api::TasksController < ApplicationController
  def index
    @tasks = Task.all
    render "index.json.jb"
  end
end
