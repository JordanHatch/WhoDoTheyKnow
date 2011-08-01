class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :name
      t.text :description
      t.string :friendly_url
      t.integer :company_id
      t.string :field
      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
