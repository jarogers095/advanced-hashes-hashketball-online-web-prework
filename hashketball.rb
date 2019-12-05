require "yaml"
require "pp"

def load_data()
  data = YAML.load_file("./hashketball.yml")
  pp data
end

def game_hash()
  load_data()
end