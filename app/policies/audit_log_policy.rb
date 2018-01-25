class AuditLogPolicy < ApplicationPolicy

 def index?
  return true if admin?
 end

 def confirm?
  #does the audit_log user.id match the current user id.
  record.user_id == user.id
 end

 private

   def admin?
     admin_types.include?(user.type)
   end
end
