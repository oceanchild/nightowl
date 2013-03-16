class Eventimage < ActiveRecord::Base
  set_table_name "events_images"
  
  belongs_to :event
  
  has_attached_file :image, 
    :styles => {:thumb => "40x40>", :small => "400x400>"},
    :default_style => :small,
    :path => ":rails_root/public/event_images/:id/:style/:basename.:extension",
    :url => "/event_images/:id/:style/:basename.:extension"

  validates_attachment_size :image, :less_than => 1.megabyte
  validates_attachment_content_type :image, :content_type=>['image/jpeg', 'image/png', 'image/gif']
  
end
