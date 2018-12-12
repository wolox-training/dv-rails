require 'spec_helper'
describe OpenLibraryService do
  describe '#book_info' do
    before do
      stub_request(:get, %r{/openlibrary.org/api/books})
        .to_return(body: hash_book_info, headers: { 'Content-Type' => 'application/json' })
    end

    subject(:info_book) do
      OpenLibraryService.new(isbn).book_info
    end

    let(:isbn) { '0385472579' }
    let(:hash_book_info) do
      File.read Rails.root.join('spec', 'support', 'fixtures', 'book_info.json')
    end

    it 'answer with a json if there is information from the book' do
      expect(info_book).to eq("ISBN": '0385472579',
                              "title": 'Zen speaks',
                              "subtitle": 'shouts of nothingness',
                              "number_of_pages": 159,
                              "authors": ['Zhizhong Cai'])
    end

    context 'When fetching a book info that not exist' do
      let(:isbn) { -1 }
      let(:hash_book_info) { {}.to_json }
      it 'return with {} if the book do not exist' do
        expect(info_book).to eq({})
      end
    end
  end
end
