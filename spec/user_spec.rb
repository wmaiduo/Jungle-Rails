require "rails_helper"

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save when password and password_confirmation are the same' do
      @user = User.new(first_name: 'something', last_name: 'something', email: 'something@something.com', password: '111', password_confirmation: '111')
      @user.save!

      expect(@user.first_name).to be_present
    end

    it 'shouldn\'t save when password and password_confirmation are not the same' do
      @user = User.new(first_name: 'something', last_name: 'something', email: 'something@something.com', password: '111', password_confirmation: '222')
      expect{@user.save!}.to raise_error
    end

    skip 'should only allow unique email to be saved' do
      @user1 = User.new(first_name: 'something1', last_name: 'something1', email: 'something@something.com', password: '111', password_confirmation: '111')
      @user1.save!
      @user2 = User.new(first_name: 'something2', last_name: 'something2', email: 'something@something.com', password: '222', password_confirmation: '222')
      expect{@user2.save!}.to raise_error
    end

    it 'should require a first name' do
      @user = User.new(first_name: nil, last_name: 'something', email: 'something@something.com', password: '111', password_confirmation: '111')
      expect{@user.save!}.to raise_error
    end

    it 'should require a last name' do
      @user = User.new(first_name: 'something', last_name: nil, email: 'something@something.com', password: '111', password_confirmation: '111')
      expect{@user.save!}.to raise_error
    end

    it 'should require a email' do
      @user = User.new(first_name: 'something', last_name: 'something', email: nil, password: '111', password_confirmation: '111')
      expect{@user.save!}.to raise_error
    end

    it 'should only accept password with more than 3 characters' do
      @user = User.new(first_name: 'something', last_name: 'something', email: 'something@something.com', password: '11', password_confirmation: '11')
      expect{@user.save!}.to raise_error
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should let user to login if credentials are correct' do
      @user = User.new(first_name: 'something', last_name: 'something', email: 'something@something.com', password: '111', password_confirmation: '111')
      @user.save!
      expect(User.new.authenticate_with_credentials('something@something.com', '111')).to be true
    end

    it 'should not let user to login if password are correct' do
      @user = User.new(first_name: 'something', last_name: 'something', email: 'something@something.com', password: '111', password_confirmation: '111')
      @user.save!
      expect(User.new.authenticate_with_credentials('something@something.com', '222')).to be false
    end

    it 'should not let user to login if username does not exist' do
      expect(User.new.authenticate_with_credentials('something@something.com', '222')).to be false
    end
  end
end
