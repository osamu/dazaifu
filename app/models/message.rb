class Message < ActiveRecord::Base
  default_scope :order => 'created_at DESC'
  paginates_per 5
  
end
