class CommandType < ActiveRecord::Base
  attr_accessible :name

  has_many :commands

  def to_s
    name
  end
end
