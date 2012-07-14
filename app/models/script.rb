class Script < ActiveRecord::Base
  attr_accessible :name, :user_id, :has_input, :input_size

  belongs_to :user
  belongs_to :route
  has_many :commands, :order => "position"

  def to_s
    name
  end

  def selections
    commands.where("target_script_id IS NOT NULL")
  end
end
