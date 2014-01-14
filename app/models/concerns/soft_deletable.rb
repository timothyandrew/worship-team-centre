require 'active_support/concern'

module SoftDeletable
  extend ActiveSupport::Concern

  included do
    scope :not_deleted, -> { where(deleted_at: nil) }
  end

  def soft_delete
    self.update_column(:deleted_at, Time.now)
  end
end