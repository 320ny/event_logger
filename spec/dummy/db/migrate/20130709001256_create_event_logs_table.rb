class CreateEventLogsTable < ActiveRecord::Migration

  def change
    create_table :event_logs do |t|
      t.string :event
      t.text :object
      t.timestamps
    end
  end

end
