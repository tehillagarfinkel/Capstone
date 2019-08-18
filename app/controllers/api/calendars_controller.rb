class Api::CalendarsController < ApplicationController
  def index
    render json: { message: "test" }
  end
end
