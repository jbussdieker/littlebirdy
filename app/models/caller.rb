class Caller < ActiveRecord::Base
  attr_accessible :name, :number, :user_id

  belongs_to :user
  has_many :routes

  def to_s
    name
  end
end
