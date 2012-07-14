class RoutesController < ApplicationController
  before_filter :authenticate_user!

  def base
    if current_user.admin
      Route
    else
      current_user.routes
    end
  end

  def index
    @routes = base.all
  end

  def new
    @route = current_user.routes.new
  end

  def edit
    @route = base.find(params[:id])
  end

  def create
    @route = current_user.routes.new(params[:route])
    if @route.save
      redirect_to routes_path
    else
      render :action => "new"
    end
  end

  def update
    @route = base.find(params[:id])
    if @route.update_attributes(params[:route])
      redirect_to routes_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @route = base.find(params[:id])
    @route.delete
    redirect_to routes_path
  end
end
