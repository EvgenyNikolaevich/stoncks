class Stock < ApplicationRecord
  belongs_to :bearer

  scope :not_deleted, -> { where(deleted_at: nil) }
end
