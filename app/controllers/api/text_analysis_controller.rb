class Api::TextAnalysisController < ApplicationController
  skip_before_action :verify_authenticity_token

  def analyze
    uploaded_file = params[:file]

    if uploaded_file.present?
      content = uploaded_file.read
      words = content.downcase.split(/\s+/)
      word_count = words.group_by(&:itself).transform_values(&:count)
      
      render json: word_count
    else
      render json: { error: 'No file uploaded' }, status: :bad_request
    end
  end
end
