class CreateConnections < ActiveRecord::Migration
  def self.up
    create_table :connections do |t|
      t.integer :person1_id
      t.integer :person2_id
      t.timestamps
    end
  end

  def self.down
    drop_table :connections
  end
end
