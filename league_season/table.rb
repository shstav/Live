module Live
  module LeagueSeason
    class Table

      include Mongoid::Document
      include Mongoid::Timestamps

      store_in collection: "league_season_tables"

      field          :league_season_id,   type: Integer
      embeds_many    :rankings,           class_name: "Live::LeagueSeason::TeamRanking"

      index "league_season_id" => 1

    end
  end
end

