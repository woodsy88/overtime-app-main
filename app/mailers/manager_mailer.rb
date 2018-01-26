class ManagerMailer < ApplicationMailer
  #the email method name has to be mapped to the name of email.text.erb
  def email manager
    #this allows you to pass manager into the view via the instance variable
    @manager = manager
    mail(to: manager.email, subject: 'Daily overtime request email')
  end
end
