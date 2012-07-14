class Message < ActiveRecord::Base
  attr_accessible :url, :new, :mailbox_id

  belongs_to :mailbox
end
