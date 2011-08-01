#!/usr/bin/ruby

require 'rubygems'
require 'active_record'
require 'yaml'
require 'csv'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => '../db/development.sqlite3',
  :pool => 5,
  :timeout => 5000)

require '../app/models/person'
require '../app/models/connection'
require '../app/models/company'
  
meetings = []

# open csv
CSV.foreach('data/david_camerons_meetings.csv') do |row|
            
  hash = {}
  hash[:date] = row[0].to_s
  hash[:name] = row[1].to_s.strip!
  hash[:company] = row[2].to_s.strip!
  hash[:description] = row[3].to_s.strip!
                  
  if hash[:company] == 'News Corp'
    hash[:company] = 'News Corporation'
  end

  puts hash.to_yaml

  meetings << hash
  
end         

@david = Person.find_by_name "David Cameron"                 

meetings.each do |m|
                                       
  puts "–-------------------------------"
                    
  # find person
  unless !m[:name] or m[:name].empty?
    c = @david.connections_to.build
                                  
    puts "Searching for #{m[:name]}...."
    p = Person.find_by_name m[:name]
    if p.present?                       
      puts "Found #{p.name} (##{p.id})."
      c.person2 = p
    else                               
      puts "Not found. Preparing to create person."
      comp = nil                                      
      unless !m[:company] or m[:company].empty?
        # find company                             
        puts "Searching for company #{m[:company]}...."
        comp = Company.find_by_name m[:company]     
        unless comp.present?                          
          puts "Company not found, creating company"
          comp = Company.create :name => m[:company]
        else
          puts "Company #{comp.name} found (##{comp.id})"
        end
      end                                             
      puts "Creating #{m[:name]}...."
      c.person2 = Person.create :name => m[:name], :company => comp, :department => 'media'
    end                                                            
    
    c.description = m[:description]
    
    matches = m[:date].to_s.match(/([A-Za-z0-9-]+)\, ([0-9]+)/)
                                    
    c.date = Date.parse( "20#{matches[1]}-#{matches[0]}-01" )
    c.date_accuracy = 'month'
    c.source = 'data'        
    
    c.save
  else
    puts "No name available for this record"
    puts m.to_yaml  
  end
            
end