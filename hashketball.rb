require "yaml"
require "pp"

def load_data()
  data = YAML.load_file("./hashketball.yml")
  