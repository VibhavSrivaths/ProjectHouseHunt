require 'test_helper'

class ReCompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @re_company = re_companies(:one)
  end

  test "should get index" do
    get re_companies_url
    assert_response :success
  end

  test "should get new" do
    get new_re_company_url
    assert_response :success
  end

  test "should create re_company" do
    assert_difference('ReCompany.count') do
      post re_companies_url, params: { re_company: {  } }
    end

    assert_redirected_to re_company_url(ReCompany.last)
  end

  test "should show re_company" do
    get re_company_url(@re_company)
    assert_response :success
  end

  test "should get edit" do
    get edit_re_company_url(@re_company)
    assert_response :success
  end

  test "should update re_company" do
    patch re_company_url(@re_company), params: { re_company: {  } }
    assert_redirected_to re_company_url(@re_company)
  end

  test "should destroy re_company" do
    assert_difference('ReCompany.count', -1) do
      delete re_company_url(@re_company)
    end

    assert_redirected_to re_companies_url
  end
end
