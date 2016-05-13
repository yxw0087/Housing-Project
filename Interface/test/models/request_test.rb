require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @request = Request.new(clid: "abc1234", gender: "F", building: "Conference Center")
  end
  
  test "valid clid should be accepted" do
    valid_clids = %w["bej0843","abc1234","zxd3469"]
    valid_clids.each do |valid_clid|
      @request.clid = valid_clid
      assert @user.valid?, "#{valid_clid.inspect} should be valid"
    end
  end
  
  #Shouldn't be more than one request at a time.
  test "clids should be unique" do
    dup_request = @request.dup
    dup_request.clid = @request.clid.upcase
    @request.save
    assert_not dup_request.valid?
  end
  
end
