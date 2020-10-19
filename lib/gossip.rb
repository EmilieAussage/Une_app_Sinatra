require 'bundler'
Bundler.require

class Gossip
  attr_accessor :author, :content, :id

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save #attention changer en fonction du doc
    CSV.open("./db/gossip.csv ","a") do |csv|
     csv  << [self.author, self.content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end
  
  def self.find(id)
    data_base = CSV.read("./db/gossip.csv")
    return data_base[id] 
  end
end
