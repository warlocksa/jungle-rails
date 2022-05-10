require 'rails_helper'

RSpec.describe UserSpec, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should validate with all the validate fields' do
    @user = User.create(first_name: 'user', last_name: 'A', email: 'TEST@TEST.com', password: '12345')
    expect(@user).to be_valid
    end

    it 'should be invaild when password no equal to password_confirmation' do
    @user = User.create(first_name: 'user', last_name: 'A', email: 'TEST@TEST.com', password: '12345', password_confirmation:"1234")
    expect(@user).to be_invalid
    end

    it 'should be invaild TEST@TEST.com equal to test@test.COM' do
      @user1 = User.create(first_name: 'user', last_name: 'A', email: 'TEST@TEST.com', password: '12345', password_confirmation:"1234")
      @user2 = User.create(first_name: 'user', last_name: 'A', email: 'TesT@TeST.Com', password: '12345', password_confirmation:"1234")
      expect(@user2).to be_invalid
    end

    it 'should be invaild when length of password is less than 4' do
      @user = User.create( first_name: 'user', last_name: 'A', email: 'TEST@TEST.com', password: '123' )
      expect(@user).to be_invalid
    end

    it 'should be invalid if email is missing' do
      @user = User.create(first_name: 'user', last_name: 'A', password: '12345')
      expect(@user).to be_invalid
    end

    it 'should be invalid if first_name is missing' do
      @user = User.create(last_name: 'A', email: 'TEST@TEST.com', password: '12345' )
      expect(@user).to be_invalid
    end

    it 'should be invalid if last_name is missing' do
      @user = User.create(first_name: 'user', email: 'TEST@TEST.com', password: '12345' )
      expect(@user).to be_invalid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'should be vaild if  TEST@TEST.com equal to    TEST@TEST.com  ' do
      @user = User.create(first_name: 'user', last_name: 'A', email: '   TEST@TEST.com  ', password: '12345', password_confirmation:"12345")
      @user.authenticate_with_credentials(@user.email, @user.password)
      expect(@user).to be_valid
    end

    it 'should be vaild if TeST@TEsT.Com equal to TEST@TEST.com  ' do
      @user = User.create(first_name: 'user', last_name: 'A', email: 'TeST@TEsT.Com', password: '12345', password_confirmation:"12345")
      @user.authenticate_with_credentials('TEST@TEST.com', @user.password)
      expect(@user).to be_valid
    end
  end

end
