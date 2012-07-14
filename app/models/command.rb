class Command < ActiveRecord::Base
  attr_accessible :command_type_id, :position, :script_id, :value, :target_script_id, :mailbox_id, :digits

  belongs_to :command_type
  belongs_to :script
  belongs_to :mailbox
  belongs_to :target, :foreign_key => "target_script_id", :class_name => "Script"
  acts_as_list :scope => :script
end
