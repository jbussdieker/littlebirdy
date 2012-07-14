class NumbersController < ApplicationController
  before_filter :authenticate_user!

  def base
    if current_user.admin
      Number
    else
      current_user.numbers
    end
  end

  def index
    @numbers = base.all
  end

  def new
    search_params = {}
    %w[in_postal_code near_number contains].each do |p|
      search_params[p] = params[p] unless params[p].nil? || params[p].empty?
    end

    account_sid = Rails.configuration.twilio_sid
    auth_token = Rails.configuration.twilio_token
    client = Twilio::REST::Client.new account_sid, auth_token
    local_numbers = client.account.available_phone_numbers.get('US').local
    @numbers = local_numbers.list(search_params)
    @number = current_user.numbers.new
  end

  def edit
    @number = base.find(params[:id])
  end

  def update
    @number = base.find(params[:id])
    if @number.update_attributes(params[:number])
      redirect_to numbers_path, notice: 'Number was successfully updated.'
    else
      render action: "edit"
    end
  end

  def create
    @number = current_user.numbers.new(params[:number])
    @number.save
    redirect_to numbers_path
  end

  def destroy
    @number = base.find(params[:id])
    @number.delete
    redirect_to numbers_path
  end
end

