module Live
  module Event
    class PlayerEvent < TeamEvent

      field   :player,   type: String


      def description(locale)
        DescriptionComposer::PlayerEvent.new(self, locale).invoke
      end

    end
  end
end

