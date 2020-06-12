class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.belongs_to :friend
      t.belongs_to :person
      t.timestamps
    end
  end
end
