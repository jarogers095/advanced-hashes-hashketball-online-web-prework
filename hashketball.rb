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
  player_holder = []
  game_hash[:home][:players].each do |player|
    if (player[:player_name] == name)
  end
end

def get_array_of_players() 
  player_holder = []
  game_hash[:home][:players].each do |player|
    player_holder.push(player)
  end