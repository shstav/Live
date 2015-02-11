require_relative "./base.rb"

module Live
  module Mapper
    class Team < Base

      def self.mapped_model_name
        Type::TEAM
      end

      field   :model_name,  type: String, default: mapped_model_name

    end
  end
end

