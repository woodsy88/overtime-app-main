require 'rails_helper'

RSpec.describe User, type: :model do
	 #before do block gets run before below blocks, thus creating a user for the tests
    before do
      @user = FactoryGirl.create(:user)
    end

    describe "creation" do
      #with info in before block, a user can be created - valid
  		it "can be created" do
  			expect(@user).to be_valid
  		end

      #if user has no first name, or last name the user is not valid
  		it "can not be created without first name" do
  			@user.first_name = nil
  			expect(@user).to_not be_valid
  		end

      it "can not be created without last name" do
        @user.last_name = nil
        expect(@user).to_not be_valid
      end

      it "can not be created without phone number" do
        @user.phone = nil
        expect(@user).to_not be_valid
      end

  	end

    describe "custom full name methods" do
      it 'has a full name method that combines first and last name' do
        expect(@user.full_name).to eq("SNOW, JON")
      end
    end
end
