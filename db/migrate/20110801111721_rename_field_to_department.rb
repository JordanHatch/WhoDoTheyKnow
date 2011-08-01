class RenameFieldToDepartment < ActiveRecord::Migration
  def self.up
    rename_column :people, :field, :department
  end

  def self.down
    rename_column :people, :department, :field
  end
end
