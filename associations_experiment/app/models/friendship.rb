class Friendship < ApplicationRecord
    belongs_to :person
    belongs_to :friend, class_name: "Person"

    after_create :create_inverse, unless: :has_inverse?
    after_destroy :destroy_inverses, if: :has_inverse?

    private
      def create_inverse 
        self.class.create inverse_friendship
      end

      def destroy_inverses
        find_inverses.destroy_all
      end

      def find_inverses
        self.class.where(inverse_friendship)
      end

      def has_inverse?
        self.class.exists?(inverse_friendship)
      end

      def inverse_friendship
        { person: friend, friend: person }
      end
end
# Creating twice as many friendships that needed.