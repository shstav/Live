module Live
  class MatchTeam

    include Mongoid::Document

    embedded_in :match,       class_name: "Live::Match"

    field :team_id,           type: Integer
    field :name,              type: String
    field :nick,              type: String
    field :short_nick,        type: String
    field :abbrev,            type: String
    field :slug,              type: String
    field :supported_locales, type: Array

    field :score,             type: Integer
    field :penalty_score,     type: Integer


    def logo
      AssetsHelper.image_path("/assets/icons/teams/h50/#{slug}.png")
    end

    def orientation
      {
        match.home_team.team_id => "home",
        match.away_team.team_id => "away"
      }[team_id]
    end

    def translate(attribute_name, locale=I18n.locale)
      translation_key = "teams.#{attribute_name}.#{team_id}"
      I18n.t(translation_key, default: send(attribute_name), locale: locale)
    end

  end
end

