@employee = Employee.create(email: "test@test.com",
                    password: "password",
                    password_confirmation: "password",
                    first_name: "Jon",
                    last_name: "Snow",
                    phone: "6475670072")

puts "1 employee created"

AdminUser.create(email: "admin@test.com",
                 password: "password",
                 password_confirmation: "password",
                 first_name: "Admin",
                 last_name: "employee",
                 phone: "6475670072")

puts "1 Admin user created"

AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 1.week))
AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 13.days))
AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 20.days))

puts "3 audit logs have been created"

100.times do |post|
	Post.create!(date: Date.today, rationale: "#{post} Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                                Sed tincidunt scelerisque elit, a convallis odio commodo vitae.
                                                Pellentesque sodales turpis eget urna varius, commodo dictum enim semper.",
                                                user_id: @employee.id, overtime_request: 2.5)
end

puts "100 posts have been created"


