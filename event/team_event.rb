module Live
  module Event
    class TeamEvent < Base

      field   :team_id,   type: Integer


      def match_team
        {
          match.home_team.team_id => match.home_team,
          match.away_team.team_id => match.away_team
        }[team_id]
      end

      def description(locale)
        raise NotImplementedError
      end

    end
  end
end

