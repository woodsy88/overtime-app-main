require 'rails_helper'

describe 'naviagte' do 

  before do
    @admin_user = FactoryGirl.create(:admin_user)
    login_as(@admin_user, :scope => :user)
  end


    describe 'edit' do
        
        before do
          @post = FactoryGirl.create(:post)
        end


        it 'has a status that can be edited on the form by an admin' do
          visit edit_post_path(@post)

          choose('post_status_approved')
          click_on "Save"

        # whenever u do a database change, you need to use reload in the test
          expect(@post.reload.status).to eq('approved')

        end


        it 'cannot be edited by a non admin' do
          # using @user instance variable makes the instance variable usable by other tests, using just user, makes it only available to this test
          logout(:user) #log out admin user
          user = FactoryGirl.create(:user) #create regular user
          login_as(user, :scope => :user) #login regular user

          visit edit_post_path(@post) #go to the edit post page

          expect(page).to_not have_content('Approved') #we dont want the edit status radio buttons to be visible on the regular users edit post page
        end

    end



  
end