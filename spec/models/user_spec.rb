require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryGirl.create(:user)
    end

    describe "creation" do
  		it "can be created" do
  			expect(@user).to be_valid
  		end
  	end

    describe "validations" do
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

      it "requires the phone attr to only contain integers" do
          @user.phone = "mygreatstr"
          expect(@user).to_not be_valid
      end

      it "requires the phone attr to have exactly 10 characters" do
        @user.phone = "12345678910"
        expect(@user).to_not be_valid
      end

    end

    describe "custom full name methods" do
      it 'has a full name method that combines first and last name' do
        expect(@user.full_name).to eq("SNOW, JON")
      end
    end
end
