class ApiController < ApplicationController
  before_filter :read_call_info
  
  def reject
    render :xml => "<Response><Reject/></Response>"
  end

  def read_call_info
    @number = Number.where(:number => params["Called"]).find(:first)
    return reject if !@number
    @caller = @number.user.callers.where(:number => params["Caller"]).find(:first)
    return reject if !@caller
    @route = @number.user.routes.where(:caller_id => @caller, :number_id => @number).find(:first)
    return reject if !@route
    @script = @route.script
  end

  def index
    if params[:script]
      @script = Script.find(params[:script]) || @script
    end
  end


  def new_message
    Message.create(:url => params["RecordingUrl"], :new => true)
    redirect_to "/api.xml"
  end

  def mailbox
    if params[:script]
      @script = Script.find(params[:script]) || @script
    end
    @messages = Message.all
    @new_messages = Message.where(:new => true)
    @saved_messages = Message.where(:new => false)
  end

  def messages
    @messages = Message.find(:all, :order => 'new DESC')

    if params[:index]
      @index = params[:index].to_i
      
      if params["Digits"] != "1"
        @messages[@index].new = false
        @messages[@index].save
      end

      if params["Digits"] == "4"
        @index = @index - 2
        @index = -1 if @index < 0
      end

      if params["Digits"] == "5"
        @index = @index - 1
        @index = -1 if @index < 0
      end

      if params["Digits"] == "7"
        @messages[@index].delete
        @messages = Message.all
      else
        @index = @index + 1
      end

      if @index >= @messages.count
        @index = -1
      end
    elsif @messages.count > 0
      @index = 0
    else
      @index = -1
    end
  end
end
