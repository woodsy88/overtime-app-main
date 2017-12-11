require 'rails_helper'

RSpec.describe User, type: :model do
  	describe "creation" do
  	
    #before do block gets run before below blocks, thus creating a user for the tests	
  		before do
  			@user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Jon", last_name: "Snow")
  		end

      #with info in before block, a user can be created - valid
  		it "can be created" do
  			expect(@user).to be_valid
  		end

      #if user has no first name, or last name the user is not valid
  		it "can not be created without first name and last name" do
  			@user.first_name = nil
  			@user.last_name = nil

  			expect(@user).to_not be_valid
  		end

  	end
end
