class LastSeenAt < ActiveRecord::Migration
  def self.up
    add_column "users", "last_seen_at", :datetime
  end

  def self.down
    remove_column "users", "last_seen_at"
  end
end
