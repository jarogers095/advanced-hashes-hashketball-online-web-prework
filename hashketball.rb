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
  game_hash[:home][:players].each do |player|
    puts player[:player_name]
  end
end