require 'test_helper'

class InterventionsControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get interventions_add_url
    assert_response :success
  end

  test "should get remove" do
    get interventions_remove_url
    assert_response :success
  end

  test "should get traitement" do
    get interventions_traitement_url
    assert_response :success
  end

  test "should get transfert" do
    get interventions_transfert_url
    assert_response :success
  end

end
