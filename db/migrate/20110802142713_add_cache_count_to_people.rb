class AddCacheCountToPeople < ActiveRecord::Migration
  def self.up   
    add_column :people, :connections_count, :integer, :default => 0

    Person.reset_column_information
    Person.all.each do |p|
      Person.update_counters p.id, :connections_count => p.connections.count
    end
  end

  def self.down
  end
end
