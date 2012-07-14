class Mailbox < ActiveRecord::Base
  attr_accessible :name, :user_id

  belongs_to :user
  has_many :messages
  has_many :commands
end
