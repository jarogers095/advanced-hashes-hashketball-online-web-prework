require "yaml"
require "pp"

def load_data()
  YAML.load_file("./hashketball.yml")
end

def game_hash()
  the_game_hash = load_data()
  
  return the_game_hash
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

def num_points_scored(name)
  get_array_of_players.each do |player|
    if player[:player_name] == name
      return player[:points]
    end
  end
end

def shoe_size(name) 
  get_array_of_players.each do |player|
    if player[:player_name] == name
      return player[:shoe]
    end
  end
end

def team_colors(team_name)
  if (game_hash[:home][:team_name] == team_name)
    return game_hash[:home][:colors]
  elsif (game_hash[:away][:team_name] == team_name)
    return game_hash[:away][:colors]
  end
end

def team_names()
  teams = []
  teams.push(game_hash[:home][:team_name])
  teams.push(game_hash[:away][:team_name])
  return teams
end

def player_numbers(team_name)
  numbers = []
  
  if (game_hash[:home][:team_name] == team_name)
    game_hash[:home][:players].each do |player|
      numbers.push(player[:number])
    end
  elsif (game_hash[:away][:team_name] == team_name)
    game_hash[:away][:players].each do |player|
      numbers.push(player[:number])
    end
  end
  
  return numbers
end

def player_stats(name)
  get_array_of_players.each do |player|
    if player[:player_name] == name
      return player.slice(:number, :shoe, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks)
    end
  end
end

def big_shoe_rebounds()
  get_array_of_players.