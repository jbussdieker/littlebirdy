class ScriptsController < ApplicationController
  def base
    if current_user.admin
      Script
    else
      current_user.scripts
    end
  end

  def index
    @scripts = base.all
  end

  def new
    @script = current_user.scripts.new
  end

  def edit
    @script = base.find(params[:id])
    @commands = @script.commands
  end

  def create
    @script = current_user.scripts.new(params[:script])
    if @script.save
      redirect_to scripts_path
    else
      render :action => "new"
    end
  end

  def update
    @script = base.find(params[:id])
    if @script.update_attributes(params[:script])
      redirect_to scripts_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @script = base.find(params[:id])
    @script.delete
    redirect_to scripts_path
  end
end
