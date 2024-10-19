class User < ApplicationRecord
  validate_uniqueness_of :username # names witll be unique
  scope :all_except, ->(user) { where.not(id: user) } # users will not be able to see themselelves
end
