require 'rails_helper'

describe 'navigate' do

#creates a user local variable available to all below tests
  let(:user) { FactoryGirl.create(:user) }

  let(:post) do
    Post.create(date: Date.today, rationale: "Rationale", user_id: user.id, daily_hours: 12.5)
  end


  before do
    login_as(user, :scope => :user)
  end
##----------Index
  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      post1 = FactoryGirl.build_stubbed(:post)
      post2 = FactoryGirl.build_stubbed(:second_post)
      visit posts_path
      expect(page).to have_content(/Rationale|content/)
    end

    it '- has a scope so that only post creators can see thier posts' do

      other_user = User.create(first_name: 'Non', last_name: 'Authorized', email: "nonauthorized@test.com", password: "password", password_confirmation: "password", phone: "5555555")

      post_from_other_user = Post.create(date: Date.today, rationale: "addf", user_id: other_user.id, daily_hours: 3.5)

      visit posts_path

      expect(page).to_not have_content(/This post shouldn't be seen/)
    end
  end
##----------New
  describe 'new' do
    it 'has a link from the homepage' do
      employee = Employee.create(first_name: 'Non', last_name: 'Authorized', email: "nonauthorized@test.com", password: "password", password_confirmation: "password", phone: "5555555")
      login_as(employee, :scope => :user)
      visit root_path

      click_link("new_post_from_nav")
      expect(page.status_code).to eq(200)
    end
  end
##----------Delete
  describe 'delete' do
    it '- can be deleted' do

     logout(:user)

     delete_user = FactoryGirl.create(:user)
     login_as(delete_user, :scope => :user)

     post_to_delete = Post.create(date: Date.today, rationale: 'asdf', user_id: delete_user.id, daily_hours: 3.5)

     visit posts_path

    click_link("delete_#{post_to_delete.id}_from_index")
    expect(page.status_code).to eq(200)
    end
  end
##----------Create
  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"
      fill_in 'post[daily_hours]', with: 1.5


     expect { click_on "Save" }.to change(Post, :count).by(1)
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      fill_in 'post[daily_hours]', with: 7.5
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end
##----------Edit
  describe 'edit' do
    it 'can be edited' do
      visit edit_post_path(post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited content"
      click_on "Save"

      expect(page).to have_content("Edited content")
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      non_authorized_user = FactoryGirl.create(:non_authorized_user)
      login_as(non_authorized_user, :scope => :user)

      visit edit_post_path(post)

      expect(current_path).to eq(root_path)
    end
  end
end
