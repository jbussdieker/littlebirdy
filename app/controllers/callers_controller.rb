class CallersController < ApplicationController
  before_filter :authenticate_user!

  def base
    if current_user.admin
      Caller
    else
      current_user.callers
    end
  end

  def index
    @callers = base.all
  end

  def new
    @caller = current_user.callers.new
  end

  def edit
    @caller = base.find(params[:id])
  end

  def create
    @caller = current_user.callers.create(params[:caller])
    if @caller.save
      redirect_to callers_path
    else
      render action: "new"
    end
  end

  def update
    @caller = base.find(params[:id])
    if @caller.update_attributes(params[:caller])
      redirect_to callers_path
    else
      render action: "edit"
    end
  end

  def destroy
    @caller = base.find(params[:id])
    @caller.delete
    redirect_to callers_path
  end
end
