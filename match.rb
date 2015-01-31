module Live
  class Match

    include Mongoid::Document
    include Mongoid::Timestamps

    store_in collection: "test_matches"

    field     :home_team,        type: String
    field     :away_team,        type: String
    field     :start_time,       type: DateTime
    field     :status,           type: String

  end
end


