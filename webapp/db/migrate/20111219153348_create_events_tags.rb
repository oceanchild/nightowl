class CreateEventsTags < ActiveRecord::Migration
  def up
    create_table :events_tags, :id => false do |t|
      t.references :event
      t.references :tag
    end
  end

  def down
    drop_table :events_tags
  end
end
