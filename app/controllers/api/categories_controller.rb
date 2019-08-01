class Api::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render "index.json.jb"
  end

  def create
    @category = Category.new(
      name: params[:name],
      image: params[:image],
      user_id: params[:user_id],
    )
    @category.save
    render "show.json.jb"
  end

  def show
    @category = Category.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @category = Category.find_by(id: params[:id])
    @category.name = params[:name] || @category.name
    @category.image = params[:image] || @category.image
    @category.user_id = params[:user_id] || @category.user_id
    @category.save
    render "show.json.jb"
  end

  def destroy
    @category = Category.find_by(id: params[:id])
    @category.destroy
    render json: { message: "Category successfully deleted" }
  end
end
