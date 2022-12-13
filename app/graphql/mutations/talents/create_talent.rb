module Mutations
  module Talents
    class CreateTalent < ::Mutations::BaseMutation
      argument :character_id, Integer, required: true
      argument :ability_summary, String, required: true
      argument :name, String, required: true
      argument :page_number, Integer, required: true

      type Types::TalentType

      def resolve(character_id:, **attributes)
        Character.find(character_id).talents.create!(attributes)
      end
    end
  end
end
