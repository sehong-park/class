class Organization < ActiveRecord::Base
  
  # DEFAULT_SCOPE
  default_scope -> { order('created_at DESC') }
  
end
