module Live
  module Event
    class Substitution < TeamEvent

      field    :event_type,   type: String,   default: Type::SUBSTITUTION
      field    :player_in,    type: String
      field    :player_out,   type: String


      def description(locale)
        DescriptionComposer::Substitution.new(self, locale).invoke
      end

    end
  end
end

