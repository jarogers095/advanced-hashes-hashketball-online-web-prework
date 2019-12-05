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
  big_shoe_player = get_array_of_players.max { |a, b| a[:shoe] <=> b[:shoe] }
  return big_shoe_player[:rebounds]
end

def most_points_scored()
  most_points = get_array_of_players.max { |a, b| a[:points] <=> b[:points] }
  return most_points[:player_name]
end

def winning_team()
  home_total = 0
  away_total = 0
  game_hash[:home][:players].each do |player| 
    home_total += player[:points]
  end
  game_hash[:away][:players].each do |player| 
    away_total += player[:points]
  end
  
  if(home_total > away_total)
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end
  
def player_with_longest_name
  long_player = get_array_of_players.max { |a, b| a[:player_name].length <=> b[:player_name].length }
  return long_player[:player_name]
end

def long_name_steals_a_ton?()
  long_player = get_array_of_players.max { |a, b| a[:player_name].length <=> b[:player_name].length }
  stealer = get_array_of_players.max { |a, b| a[:steals] <=> b[:steals] }
  
  if (long_player[:player_name] == stealer[:player_name])
    return true
  else
    return FALSE
  end
end