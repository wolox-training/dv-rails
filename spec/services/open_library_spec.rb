require 'spec_helper'
describe OpenLibraryService do
  describe '#book_info' do
    before do
      stub_request(:get, %r{/openlibrary.org\/api\/books/})
        .to_return(body: hash_book_info)
    end

    subject(:info_book) do
      OpenLibraryService.new(isbn).book_info
    end

    let(:isbn) { '0385472579' }
    let(:hash_book_info) do
      {
        'ISBN:0385472579' => { 'publishers' => [{ 'name' => 'Anchor Books' }],
                               'pagination' => '159 p. :',
                               'identifiers' => { 'lccn' => ['93005405'],
                                                  'openlibrary' => ['OL1397864M'],
                                                  'isbn_10' => ['0385472579'],
                                                  'librarything' => ['192819'],
                                                  'goodreads' => ['979250'] },
                               'subtitle' => 'shouts of nothingness',
                               'title' => 'Zen speaks',
                               'url' => 'https://openlibrary.org/books/OL1397864M/Zen_speaks',
                               'number_of_pages' => 159,
                               'cover' => { 'small' => 'https://covers.openlibrary.org/b/id/-S.jp',
                                            'large' => 'https://covers.openlibrary.org/b/id/-L.jg',
                                            'medium' => 'https://covers.openlibrary.org/b/i-M.g' },
                               'subjects' => [{ 'url' => 'https://openlibrary.org/subjects/',
                                                'name' => 'Caricatures and cartoons' },
                                              { 'url' => 'https://openlibrary.org/subjects/',
                                                'name' => 'Zen Buddhism' }],
                               'publish_date' => '1994',
                               'key' => '/books/OL1397864M',
                               'authors' => [{ 'url' => 'https://openlibrary.org/autho/Zhizhg_Cai',
                                               'name' => 'Zhizhong Cai' }],
                               'classifications' => { 'dewey_decimal_class' => ['294.3/927'],
                                                      'lc_classifications' => ['BQ926.T7311994'] },
                               'publish_places' => [{ 'name' => 'New York' }] }
      }.to_json

      it 'answer with a json if there is information from the book' do
        expect(JSON.parse(info_book.body)).to eq({"ISBN":"0385472579",
                                                  "title":"Zen speaks",
                                                  "subtitle":"shouts of nothingness",
                                                  "number_of_pages":159,
                                                  "authors":["Zhizhong Cai"]})

      end

      context 'When fetching a book info that not exist' do
        let(:isbn) { -1 }
        let(:hash_book_info) { {} }
        it 'responds with 404 if the book info do not exist' do
          expect(JSON.parse(info_book.body)).to eq({})
        end
      end
    end
  end
end
