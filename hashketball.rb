require 'pry'

def game_hash
  {
    :home => {
        :team_name => "Brooklyn Nets",
        :colors => [ "Black", "White" ],
        :players => [{
            :player_name => "Alan Anderson",
            :number =>      0,
            :shoe =>        16,
            :points =>      22,
            :rebounds =>    12,
            :assists =>     12,
            :steals =>      3,
            :blocks =>      1,
            :slam_dunks =>  1
        },{
            :player_name => "Reggie Evans",
            :number =>      30,
            :shoe =>        14,
            :points =>      12,
            :rebounds =>    12,
            :assists =>     12,
            :steals =>      12,
            :blocks =>      12,
            :slam_dunks =>  7
        },{
            :player_name => "Brook Lopez",
            :number =>      11,
            :shoe =>        17,
            :points =>      17,
            :rebounds =>    19,
            :assists =>     10,
            :steals =>      3,
            :blocks =>      1,
            :slam_dunks =>  15
        },{
            :player_name => "Mason Plumlee",
            :number =>      1,
            :shoe =>        19,
            :points =>      26,
            :rebounds =>    11,
            :assists =>     6,
            :steals =>      3,
            :blocks =>      8,
            :slam_dunks =>  5
        },{
            :player_name => "Jason Terry",
            :number =>      31,
            :shoe =>        15,
            :points =>      19,
            :rebounds =>    2,
            :assists =>     2,
            :steals =>      4,
            :blocks =>      11,
            :slam_dunks =>  1
        }]
    },
    :away => {
        :team_name => "Charlotte Hornets",
        :colors => [ "Turquoise", "Purple" ],
        :players => [{
            :player_name => "Jeff Adrien",
            :number =>      4,
            :shoe =>        18,
            :points =>      10,
            :rebounds =>    1,
            :assists =>     1,
            :steals =>      2,
            :blocks =>      7,
            :slam_dunks =>  2
        },{
            :player_name => "Bismack Biyombo",
            :number =>      0,
            :shoe =>        16,
            :points =>      12,
            :rebounds =>    4,
            :assists =>     7,
            :steals =>      22,
            :blocks =>      15,
            :slam_dunks =>  10
        },{
            :player_name => "DeSagna Diop",
            :number =>      2,
            :shoe =>        14,
            :points =>      24,
            :rebounds =>    12,
            :assists =>     12,
            :steals =>      4,
            :blocks =>      5,
            :slam_dunks =>  5
        },{
            :player_name => "Ben Gordon",
            :number =>      8,
            :shoe =>        15,
            :points =>      33,
            :rebounds =>    3,
            :assists =>     2,
            :steals =>      1,
            :blocks =>      1,
            :slam_dunks =>  0
        },{
            :player_name => "Kemba Walker",
            :number =>      33,
            :shoe =>        15,
            :points =>      6,
            :rebounds =>    12,
            :assists =>     12,
            :steals =>      7,
            :blocks =>      5,
            :slam_dunks =>  12
        },
        ]}
    }
end

def num_points_scored(players_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:points]
          end
        end
      end
    end
  end
end

def shoe_size(players_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names
  new_arr = []
  game_hash.each do |place, team|
  new_arr << team[:team_name]
  end
  new_arr
end

def player_numbers(team_name)
  nums = []
  game_hash.each do |place, team|
    if team[:team_name] == team_name
     team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          nums << player[:number]
          end
        end
      end
    end
  end
  nums
end

def player_stats(players_name)
  new_hash = {}
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if player[:player_name] == players_name
            new_hash = player.delete_if do |k,v|
              k == :player_name
            end
          end
        end
      end
    end
  end
  new_hash
end

def big_shoe_rebounds
    biggest_shoe = 0
    num_rebounds = 0
	
      game_hash.each do |place, team|
      team[:players].each do |player|
        if player[:shoe] > biggest_shoe
         biggest_shoe = player[:shoe]
	       num_rebounds = player[:rebounds]
	    end
    end
  end
  num_rebounds
end

def most_points_scored
  most_points = 0
  player = ""
  game_hash.each do |team_position, team_data|
    team_data[:players].each do |player_name|
      if most_points < player_name[:points]
         player = player_name[:player_name]
        most_points = player_name[:points]
      else 
        most_points
        end
      end
    end
  player 
end

def winning_team
  home = 0
  away = 0
  game_hash.each do | team_position, team_data|
    if team_position == :home
      team_data[:players].each do |players|
        home = home + players[:points]
      end
    end
    if team_position == :away
      team_data[:players].each do |players|
        away = away + players[:points]
      end
    end
  end
  if home == away
    return "it's a tie"
  elsif home > away
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |location, team|
    team[:players].each do |stats|
      if stats[:player_name].length > longest_name.length
          longest_name = stats[:player_name]
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  
end



=begin
def player_with_longest_name
   longest_name_length = 0
   player_with_longest_name = "player"
   game_hash.each do |location, team|
     team.each do |attribute, data|
       if attribute == :players
         data.each do |player|
           binding.pry
           if player[:player_name].length > longest_name_length
             longest_name_length = player[:player_name].length
             player_with_longest_name = player[:player_name]
           end
         end
       end
     end
   end
   player_with_longest_name
 end
=end