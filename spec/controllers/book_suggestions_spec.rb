require 'rails_helper'
describe BookSuggestionsController do
  describe 'POST #create' do
    subject(:create_request) { post :create, params: params }
    context 'When fetching a specific book' do
      let(:params) { { book_suggestion: attributes_for(:book_suggestion) } }

      it 'responds with 201 status' do
        expect(create_request).to have_http_status(:created)
      end

      it 'creates the book suggestion' do
        expect { create_request }.to change(BookSuggestion, :count).by(1)
      end
    end

    context 'When fetching a book that not exist' do
      let(:params) { { book_suggestion: attributes_for(:book_suggestion, title: nil) } }

      it 'responds with 422 status' do
        expect(create_request).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
