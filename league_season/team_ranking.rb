module Live
  module LeagueSeason
    class TeamRanking

      include Mongoid::Document

      embedded_in :league_season_table,   class_name: "Live::LeagueSeason::Table"

      field          :team_id,          type: Integer
      field          :rank,             type: Integer
      field          :games_played,     type: Integer
      field          :goal_diff,        type: Integer
      field          :points,           type: Integer
      field          :wins,             type: Integer
      field          :losses,           type: Integer
      field          :draws,            type: Integer
      field          :goals_for,        type: Integer
      field          :goals_against,    type: Integer

    end
  end
end

