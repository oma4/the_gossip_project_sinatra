
class Gossip

  attr_accessor :author , :content 

  def initialize(author,content) 
    @author = author
    @content = content 
  end

    def save
  CSV.open("./db/gossip.csv", "ab") do |csv| #CSV en mode écriture
    csv << ["@author","@content"] # 2*colonne 
    end
  end

  def self.all # ajouter au fichier csv 
  all_gossips = [] 
  CSV.read("./db/gossip.csv").each do |csv_line|
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
  end
  return all_gossips

  end 
end 
  
