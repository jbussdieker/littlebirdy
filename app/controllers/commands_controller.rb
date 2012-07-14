class CommandsController < ApplicationController
  def new
    @script = Script.find(params[:script_id])
    @command = @script.commands.new
  end

  def create
    @script = Script.find(params[:script_id])
    @command = @script.commands.new(params[:command])
    if @command.save
      redirect_to edit_script_path(@script)
    else
      render :action => "new"
    end
  end

  def edit
    @script = Script.find(params[:script_id])
    @command = @script.commands.find(params[:id])
  end

  def update
    @script = Script.find(params[:script_id])
    @command = @script.commands.find(params[:id])
    if @command.update_attributes(params[:command])
      redirect_to edit_script_path(@script)
    else
      render :action => "edit"
    end
  end

  def move
    @script = Script.find(params[:script_id])
    @command = @script.commands.find(params[:id])
    @command.send(params[:direction])
    redirect_to edit_script_path(@script)
  end

  def destroy
    @script = Script.find(params[:script_id])
    @command = @script.commands.find(params[:id])
    @command.delete
    redirect_to edit_script_path(@script)
  end
end
