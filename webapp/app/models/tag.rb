class Tag < ActiveRecord::Base
  has_and_belongs_to_many :events
  has_and_belongs_to_many :users
  
  validates :name, :uniqueness => true
end
