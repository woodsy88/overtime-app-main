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

end
