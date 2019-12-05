require "yaml"
require "pp"

def load_data()
  YAML.load_file("./hashketball.yml")
end

def game_hash()
  the_game_hash = load_data()
  
  return the_game_hash
end

def num_points_scored(name)
  get_array_of_players.each do |player|
    if player[:player_name] == name
      return player[:points]
    end
  end
end

def get_array_of_players() 
  player_holder = []
  
  game_hash[:home][:players].each do |player|
    player_holder.push(player)
  end
  game_hash[:away][:players].each do |player|
    player_holder.push(player)
  end
  
  return player_holder
end