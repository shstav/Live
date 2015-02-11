module Live
  module Event
    module Type

      MATCH_STARTED                  = "Match Started"
      HALF_TIME_STARTED              = "Half Time Started"
      SECOND_HALF_STARTED            = "Second Half Started"
      OVERTIME_FIRST_HALF_STARTED    = "Overtime First Half Started"
      OVERTIME_HALF_TIME_STARTED     = "Overtime Half Time Started"
      OVERTIME_SECOND_HALF_STARTED   = "Overtime Second Half Started"
      PENALTIES_STARTED              = "Penalties Started"
      MATCH_ENDED                    = "Match Ended"

      GOAL                           = "Goal"
      OWN_GOAL                       = "Own Goal"
      PENALTY_GOAL                   = "Penalty Goal"
      PENALTY_SHOOTOUT_GOAL          = "Penalty Shootout Goal"
      PENALTY_SHOOTOUT_MISSED        = "Penalty Shootout Missed"
      YELLOW_CARD                    = "Yellow Card"
      SECOND_YELLOW_CARD             = "Second Yellow Card"
      RED_CARD                       = "Red Card"
      SUBSTITUTION                   = "Substitution"


      TYPE_TO_MODEL = {
        MATCH_STARTED                => Base,
        HALF_TIME_STARTED            => Base,
        SECOND_HALF_STARTED          => Base,
        OVERTIME_FIRST_HALF_STARTED  => Base,
        OVERTIME_HALF_TIME_STARTED   => Base,
        OVERTIME_SECOND_HALF_STARTED => Base,
        PENALTIES_STARTED            => Base,
        MATCH_ENDED                  => Base,
        GOAL                         => PlayerEvent,
        OWN_GOAL                     => PlayerEvent,
        PENALTY_GOAL                 => PlayerEvent,
        PENALTY_SHOOTOUT_GOAL        => PlayerEvent,
        PENALTY_SHOOTOUT_MISSED      => PlayerEvent,
        YELLOW_CARD                  => PlayerEvent,
        SECOND_YELLOW_CARD           => PlayerEvent,
        RED_CARD                     => PlayerEvent,
        SUBSTITUTION                 => Substitution,
      }.with_indifferent_access

    end
  end
end

