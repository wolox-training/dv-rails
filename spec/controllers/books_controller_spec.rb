require 'rails_helper'

describe BooksController do
  describe 'GET #index' do
    subject(:http_request) do
      get :index
    end
    
    let!(:books) { create_list(:book, 70) }

    it 'responses with the books json' do
      expect(JSON.parse(http_request.body)['total_count']).to eq(Book.all.count)
    end

    it 'responds with 200 status' do
      expect(http_request).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    subject(:http_request) do
      get :show, params: { id: id }
    end
    
    let(:book) { create(:book) }

    context 'When fetching a specific book' do
      let(:id) { book.id }

      it 'response one book in json' do
        expect(http_request.body).to eq BookSerializer.new(
          book, root: false
        ).to_json
      end

      it 'responds with 200 status' do
        expect(http_request).to have_http_status(:ok)
      end
    end

    context 'When fetching a book that not exist' do
      let(:id) { -1 } 

      it 'responds with 404 if the book do not founded ' do
        expect(http_request).to have_http_status(:not_found)
      end
    end
  end
end
