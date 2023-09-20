require 'rails_helper'

RSpec.describe Api::TextAnalysisController, type: :controller do
  describe 'POST #analyze' do
    context 'with a valid text file' do
      let(:text_file) { fixture_file_upload('valid_text_file.txt', 'text/plain') }

      it 'returns a JSON response with word counts' do
        post :analyze, params: { file: text_file }
        expect(response).to have_http_status(:success)
        expect(response.content_type).to start_with('application/json')

        json_response = JSON.parse(response.body)
        expect(json_response).to include('hello' => 3, 'world' => 2, 'hi' => 2, 'lol' => 4)
      end
    end

    context 'with no file uploaded' do
      it 'returns a bad request response' do
        post :analyze
        expect(response).to have_http_status(:bad_request)
        expect(response.content_type).to start_with('application/json')

        json_response = JSON.parse(response.body)
        expect(json_response).to include('error' => 'No file uploaded')
      end
    end
  end
end
