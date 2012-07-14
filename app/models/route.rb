class Route < ActiveRecord::Base
  attr_accessible :name, :script_id, :caller_id, :number_id, :user_id

  belongs_to :caller
  belongs_to :number
  belongs_to :user
  belongs_to :script
end
