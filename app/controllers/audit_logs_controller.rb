class AuditLogsController < ApplicationController

  def index
    @audit_logs = AuditLog.page(params[:page]).per(10)
    authorize @audit_logs
  end

  def confirm
    audit_log = AuditLog.find(params[:id])
    #pundit - posts policy
    authorize audit_log
    #changing enum status from submitted to approved
    audit_log.confirmed!
    redirect_to root_path, notice: "Thank you, your confirmation
                                    has been succesfuly made"
  end
end
