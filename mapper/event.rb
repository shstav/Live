require_relative "./base.rb"

module Live
  module Mapper
    class Event < Base

      def self.mapped_model_name
        Type::EVENT
      end

      field   :model_name,  type: String, default: mapped_model_name


      def self.to_live_object(provider_event_id, match)
        event_live_id = to_live_id(provider_event_id)
        match.events_finder.by_id(event_live_id)
      end

    end
  end
end

