class Number < ActiveRecord::Base
  attr_accessible :name, :number

  belongs_to :user
  has_many :routes

  def to_s
    name
  end
end
