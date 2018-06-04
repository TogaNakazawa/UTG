class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    Project.create(title:params[:title], content:params[:content], founder_id:params[:founder_id],required_number:params[:required_number])
    redirect_to :action => 'index'
  end

  def update
    @project.title = params[:title]
    @project.content = params[:content]
    @project.founder_id = params[:founder_id]
    @project.required_number = params[:required_number]
    @project.save
  end

  def show
    @project = Project.find(params[:id])
    @founder = User.find(@project.founder_id)
  end
end
