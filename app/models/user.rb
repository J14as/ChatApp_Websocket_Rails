class User < ApplicationRecord
    belongs_to :rooms
    belongs_to :messages
    validates_uniqueness_of :username
    scope :all_except, ->(user) { where.not(id: user) }
    after_create_commit { broadcast_append_to "users" }
end
