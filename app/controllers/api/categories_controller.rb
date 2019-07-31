class Api::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render "index.json.jb"
  end

  def create
    @category = Category.new(
      name: params[:name],
      image: params[:image],
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
    @category.save
    render "show.json.jb"
  end
end
