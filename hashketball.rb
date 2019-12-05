require "yaml"
require "pp"

def load_data(path)
  data = YAML.load_file(path)