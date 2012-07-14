class MailboxesController < ApplicationController
  def index
    @mailboxes = current_user.mailboxes
  end

  def new
    @mailbox = current_user.mailboxes.new
  end

  def edit
    @mailbox = current_user.mailboxes.find(params[:id])
  end

  def create
    @mailbox = current_user.mailboxes.new(params[:mailbox])
    @mailbox.save
    redirect_to mailboxes_path
  end

  def destroy
    @mailbox = current_user.mailboxes.find(params[:id])
    @mailbox.delete
    redirect_to mailboxes_path
  end
end
