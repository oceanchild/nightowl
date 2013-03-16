class Eventtypes < ActiveRecord::Base
  set_table_name "events_types"

  has_many :events
end
