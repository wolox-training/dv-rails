require 'rails_helper'
describe BooksController do
  include_context 'Authenticated User'
  describe 'GET #index' do
    subject(:index_request) { get :index }

    let!(:books) { create_list(:book, 70) }

    it 'returns with the books json' do
      expect(JSON.parse(index_request.body)['total_count']).to eq(Book.all.count)
      expect(JSON.parse(index_request.body)['count']).to eq(25)
    end

    it 'responds with 200 status' do
      expect(index_request).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    subject(:show_request) do
      get :show, params: { id: id }
    end

    let(:book) { create(:book) }

    context 'When fetching a specific book' do
      let(:id) { book.id }

      it 'response one book in json' do
        expect(show_request.body).to eq BookSerializer.new(
          book, root: false
        ).to_json
      end

      it 'responds with 200 status' do
        expect(show_request).to have_http_status(:ok)
      end
    end

    context 'When fetching a book that not exist' do
      let(:id) { -1 }

      it 'responds with 404 if the book do not founded ' do
        expect(show_request).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET #info_book' do
    before do
      allow_any_instance_of(OpenLibraryService).to receive(:book_info).and_return(hash_book_info)
    end

    subject(:info_book_request) do
      get :info_book, params: { isbn: isbn }
    end

    let(:isbn) { '0385472579' }
    let(:hash_book_info) do
      {
        ISBN: Faker::Number.number(10),
        title: Faker::Book.title,
        subtitle: Faker::Book.title,
        number_of_pages: Faker::Number.number(3),
        authors: Faker::Book.author
      }
    end

    it 'responds with 200 status if book info exist' do
      expect(info_book_request).to have_http_status(:ok)
    end

    context 'When fetching a book info that not exist' do
      let(:isbn) { -1 }
      let(:hash_book_info) { {} }

      it 'responds with 404 if the book info do not exist' do
        expect(info_book_request).to have_http_status(:not_found)
      end
    end
  end
end
