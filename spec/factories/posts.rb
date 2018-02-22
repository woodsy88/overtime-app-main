FactoryGirl.define do
  factory :post do
    date Date.today
    work_performed "work_performed"
    daily_hours 2.5
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    work_performed "Some more content"
    user
    daily_hours 0.5
  end
end
