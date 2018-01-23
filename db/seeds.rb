@user = User.create(email: "test@test.com",
                    password: "password",
                    password_confirmation: "password",
                    first_name: "Jon",
                    last_name: "Snow",
                    phone: "6475670072")

puts "1 User created"

AdminUser.create(email: "admin@test.com",
                 password: "password",
                 password_confirmation: "password",
                 first_name: "Admin",
                 last_name: "User",
                 phone: "6475670072")

puts "1 Admin User created"

100.times do |post|
	Post.create!(date: Date.today, rationale: "#{post} Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt scelerisque elit, a convallis odio commodo vitae. Pellentesque sodales turpis eget urna varius, commodo dictum enim semper.", user_id: @user.id, overtime_request: 2.5)
end


AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 1.week))
AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 13.days))
AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 20.days))


puts "3 audit logs have been created"
