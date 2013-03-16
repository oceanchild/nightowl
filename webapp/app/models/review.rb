class Review < ActiveRecord::Base
  validates :initiator_id, :presence => true
  validates :content, :presence => true, :length => { :maximum => 300 }
  has_and_belongs_to_many :users
 
  has_attached_file :image, 
    :styles => {:thumb => "40x40>", :small => "400x400>"},
    :default_style => :small,
    :path => ":rails_root/public/review_images/:id/:style/:basename.:extension",
    :url => "/review_images/:id/:style/:basename.:extension"

  validates_attachment_size :image, :less_than => 1.megabyte
  validates_attachment_content_type :image, :content_type=>['image/jpeg', 'image/png', 'image/gif']
end
