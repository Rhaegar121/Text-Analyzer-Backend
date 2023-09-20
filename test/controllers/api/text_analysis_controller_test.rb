require 'test_helper'

class Api::TextAnalysisControllerTest < ActionDispatch::IntegrationTest
  test 'should get analyze' do
    get api_text_analysis_analyze_url
    assert_response :success
  end
end
