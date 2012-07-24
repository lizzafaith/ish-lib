require 'test_helper'

class NoUserTest < ActiveSupport::TestCase
  
  setup do
    ;
  end
  
  test 'create nouser from user if former does not exist' do
    email = 'htbgrvfec@gmail.com'
    descr = 'some descr'
    
    exists = NoUser.create( :email => email, :descr => descr )
    u = User.new(:email => email)
    u.save
    result = NoUser.from_user u
    assert_equal NoUser, result.class
    
    result.remove
    u.destroy
  end
  
  test 'fetch nouser based of user if former exists' do
    email = 'htbgrvfec@gmail.com'
    
    
    NoUser.where( :email => email ).each { |y| y.remove }
    result = NoUser.where( :email => email ).first
    assert_nil result
    
    u = User.new(:email => email)
    u.save
    
    result = NoUser.from_user u
    assert_equal NoUser, result.class
    
    result.remove
    u.destroy
  end
  
end
