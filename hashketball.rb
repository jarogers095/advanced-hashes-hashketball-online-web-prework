require "yaml"
require "pp"

def load_data()
  YAML.load_file("./hashketball.yml")
end

def game_hash()
  the_game_hash = load_data()
  pp the_game_hash
  return the_game_hash
end