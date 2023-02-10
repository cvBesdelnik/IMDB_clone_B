require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get filtr_by_category" do
    get reports_filtr_by_category_url
    assert_response :success
  end
end
