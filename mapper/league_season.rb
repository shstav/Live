require_relative "./base.rb"

module Live
  module Mapper
    class LeagueSeason < Base

      def self.mapped_model_name
        Type::LEAGUE_SEASON
      end

      field   :model_name,  type: String, default: mapped_model_name

    end
  end
end
