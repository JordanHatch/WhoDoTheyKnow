class AddExtraFieldsToConnections < ActiveRecord::Migration
  def self.up
    add_column :connections, :description, :string
    add_column :connections, :date, :datetime
    add_column :connections, :date_accuracy, :string
    add_column :connections, :source, :string
    add_column :connections, :source_url, :string
  end

  def self.down
    remove_column :connections, :source_url
    remove_column :connections, :source
    remove_column :connections, :date_accuracy
    remove_column :connections, :date
    remove_column :connections, :description
  end
end
