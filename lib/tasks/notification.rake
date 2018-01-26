namespace :notification do
  desc "send sms notification to employees asking them to log overtime or not"
  task sms: :environment do
    puts "Im in a rake task"
    # 1. Schedule Sunday at 5pm
    # 2. Iterate over all empolyees
    # 3. Skip AdminUsers
    # 4. Send a link that has instructions and a link to log time

    # User.all.each do |user|
    #   SmsTool.send_sms()

    #number: "5555555"
    # no spaces or dashes
    # exactly 10 characters
    #  all characters have to be a mumber
  end

  desc "send email notification to managers (admin users) each day to inform of pending overtime requests"
  task manager_email: :environment do
    # 1. Iterate over the list of pending (submitted) overtime requests
    # 2. Check to see if there are any requests
    # 3. Iterate over the list of admin users
    # 4. Send the email to each admin

    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
      end
    end
  end
end
