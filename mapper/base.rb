module Live
  module Mapper
    class Base

      include Mongoid::Document
      include Mongoid::Timestamps

      store_in collection: "mappers"

      OPTA_PROVIDER_NAME = "Opta"

      field  :provider_name,  type: String, default: OPTA_PROVIDER_NAME
      field  :model_name,     type: String
      field  :provider_id,    type: String
      field  :live_id,        type: String

      validates_presence_of :provider_name, :model_name, :provider_id, :live_id

      index({"provider_name" => 1}, {background: true})
      index({"model_name"    => 1}, {background: true})
      index({"provider_id"   => 1}, {background: true})
      index({"live_id"       => 1}, {background: true})


      def self.mapped_model_name
        raise NotImplementedError
      end

      def self.to_live_object(given_provider_id)
        object_live_id = to_live_id(given_provider_id)
        mapped_model_name.constantize.find(object_live_id) rescue nil
      end

      def self.to_live_id(given_provider_id)
        find_by(provider_id: given_provider_id,
                model_name:  mapped_model_name)
        .try(:live_id)
      end

      def self.to_provider_id(given_live_id)
        find_by(live_id:    given_live_id,
                model_name: mapped_model_name)
        .try(:provider_id)
      end

    end
  end
end

