# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

require 'spec_helper'
describe User do
 
  before { @user = User.new(name: "Example User", email: "user@example.com") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  #before(:each) do

   # @user = { :name => "Example User", :email => "user@example.com" }
    #@user = Factory :user
  #end
  it { should be_valid }
  
  describe "when name is not present" do
    before { @user.name = " " }
      it { should_not be_valid }
  end

  it "should create a new instance given valid attributes" do 
    User.create!(@user)
  end
  
  describe "should require a name" do
    before { @user.name = " " }
        it { should_not be_valid }
  end
  
  describe "should require an email address" do
    before {@user.email = " "}
      it { should_not be_valid }
  end

  describe "should reject names that are too long" do
    long_name = "a" * 51
    before { @user.name = long_name }
    it { should_not be_valid }
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp] 
    addresses.each do |address|
      valid_email_user = User.new(@user.merge(:email => address))
      valid_email_user.should be_valid
    end 
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.] 
    addresses.each do |address|
      invalid_email_user = User.new(@user.merge(:email => address))
      invalid_email_user.should_not be_valid
    end 
  end

  it "should reject duplicate email addresses" do
    # Put a user with given email address into the database.
    User.create!(@user)
    user_with_duplicate_email = User.new(@user)
    user_with_duplicate_email.should_not be_valid
  end
  
  it "should reject email addresses identical up to case" do
    upcased_email = @user[:email].upcase
    User.create!(@user.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@user)
    user_with_duplicate_email.should_not be_valid
  end

end

