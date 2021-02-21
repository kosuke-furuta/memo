require 'test_helper'

class TaskMemosControllerTest < ActionDispatch::IntegrationTest
  def setup
    @taskmemo = taskmemos(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Taskmemo.count' do
      post microposts_path, params: { taskmemo: { remarks: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Taskmemo.count' do
      delete taskmemo_path(@taskmemo)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong taskmemo" do
    log_in_as(users(:michael))
    taskmemo = taskmemos(:ants)
    assert_no_difference 'Taskmemo.count' do
      delete taskmemo_path(taskmemo)
    end
    assert_redirected_to root_url
  end

end
