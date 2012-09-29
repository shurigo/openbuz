require 'spec_helper'

describe User do
 
  before do
    @user = User.new(name: "Example User", email: "user@example.com", gender: "m", password: "Foobar123", password_confirmation: "Foobar123") 
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:gender) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should be_valid }
  
  describe "when name is not present" do
    before { @user.name = " " }
        it { should_not be_valid }
  end

  describe "should require a name" do
    before { @user.name = " " }
        it { should_not be_valid }
  end
  
  describe "should require an email address" do
    before { @user.email = " " }
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
      @user.email = address
      @user.should be_valid
    end 
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.] 
    addresses.each do |address|
      @user.email = address
      @user.should_not be_valid
    end 
  end
  
  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end
    it { should_not be_valid }
  end
  
  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    
    it { should_not be_valid }
  end
  
  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
end

