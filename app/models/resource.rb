class Resource < ActiveRecord::Base
  acts_as_attachment :storage => :file_system
end