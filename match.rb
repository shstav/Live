module Live
  class Match

    include Mongoid::Document
    include Mongoid::Timestamps
    include Tenacity
    store_in collection: "matches"

    auto_increment :_id
    embeds_one     :home_team,        class_name: "Live::MatchTeam"
    embeds_one     :away_team,        class_name: "Live::MatchTeam"
    field          :league_id,        type: Integer
    field          :league_season_id, type: Integer
    field          :start_time,       type: DateTime
    field          :half_start_time,  type: DateTime
    field          :status,           type: String
    embeds_many    :events,           class_name: "Live::Event::Base",
                                      # Allows embedded documents to have timestamps
                                      cascade_callbacks: true
    field          :lineups,          type: Hash
    field          :stats,            type: Hash
    field          :commentary,       type: Array


    validates_presence_of :start_time, :league_season_id, :status


    index({"home_team.team_id" => 1}, {background: true})
    index({"away_team.team_id" => 1}, {background: true})
    index({"league_season_id"  => 1}, {background: true})
    index({"league_id"         => 1}, {background: true})
    index({"start_time"        => 1}, {background: true})
    index({"status"            => 1}, {background: true})


    default_scope asc(:start_time)
    scope :basic_fields, -> do
      only(:home_team, :away_team, :league_id, :league_season_id,
           :start_time, :half_start_time, :status)
    end
    scope :at, -> (time) do # Note: 'time' be both a time range or a DateTime
      where(start_time: time)
    end
    scope :of_teams, -> (team_ids) do
      self.or({"home_team.team_id" => {"$in" => [*team_ids].map(&:to_i)}},
              {"away_team.team_id" => {"$in" => [*team_ids].map(&:to_i)}})
    end


    def minute
      MatchServices::MinuteCalculator.invoke(self)
    end

    def phase
      @phase ||= MatchServices::Phase.new(self)
    end

    def aggregated
      @aggregated ||= MatchServices::Aggregated.new(self)
    end

    def events_finder
      @events_finder ||= MatchServices::EventsFinder.new(self)
    end

  end
end

