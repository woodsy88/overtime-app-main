class AuditLog < ApplicationRecord
  enum status: { pending: 0, confirmed: 1, rejected: 2 }

  belongs_to :user
  validates_presence_of :user_id, :status, :start_date

  after_initialize :set_defaults

  private

  def set_defaults
    #if there is a start_date, use that - if not run the code on the right. sets a default when value is nil
    self.start_date ||= Date.today - 6.days
  end
end
