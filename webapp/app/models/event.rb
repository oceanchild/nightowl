class Event < ActiveRecord::Base
  
  has_one :reviews
  has_many :eventimages, :dependent => :destroy
  accepts_nested_attributes_for :eventimages, :allow_destroy => true
  belongs_to :events_types
  
  validates :event_date, :presence => true
  validates :theme, :presence => true, :length => {:within => 3..30}
  validates :lat, :presence => true
  validates :lng, :presence => true
  
  before_save :input_validation
  
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :users

  protected
    def input_validation
           
    end
end
