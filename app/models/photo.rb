class Photo < ActiveRecord::Base

  validates_presence_of :data, :file_type
end
