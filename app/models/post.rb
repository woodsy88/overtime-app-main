class Post < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2 }
	belongs_to :user, optional: true
	validates_presence_of :date, :rationale, :overtime_request

  validates :overtime_request, numericality: { greater_than: 0.0 }

  # scope to show current_user ony posts they created in index view
  scope :posts_by, ->(user) { where(user_id: user.id) }

  after_save :update_audit_log

  private

    def update_audit_log
      audit_log = AuditLog.where(user_id: self.user_id, start_date: (self.date - 7.days..self.date)).last

      # the if statement makes sure there there is an audit log, if its nil skip over it - called a 'nil guard'
      audit_log.confirmed! if audit_log
    end

end
