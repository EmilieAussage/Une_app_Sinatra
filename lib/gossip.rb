
class Gossip
  attr_accessor = :author, :content

  def initialize(author, content)
    @author= author
    @content= content
  end

  def save 
    File.open("/Users/user/Documents/THP/the_gossip_project_sinatra/db/gossip.JSON","w") do |f|
      f  << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    File.read("./db/gossip.json").each do |json_line|
      all_gossips << Gossip.new(json_line[0], json_line[1])
    end
    return all_gossips
  end

end
