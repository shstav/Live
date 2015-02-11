module Live
  module Event
    class Base

      include Mongoid::Document
      include Mongoid::Timestamps

      embedded_in :match,       class_name: "Live::Match", inverse_of: :events
      field       :event_type,  type: String
      field       :minute,      type: Integer
      field       :timestamp,   type: DateTime


      def description(locale)
        DescriptionComposer::Base.new(self, locale).invoke
      end

    end
  end
end

