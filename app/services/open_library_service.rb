class OpenLibraryService
  include HTTParty
  base_uri 'openlibrary.org/api/books'

  FORMAT = 'json'.freeze
  JSCMD = 'data'.freeze

  def initialize(isbn)
    @isbn = isbn
    @options = {
      query: {
        bibkeys: @isbn,
        format: FORMAT,
        jscmd: JSCMD
      }
    }
  end

  def book_info
    response = retrieve_from_api
    return {} if response.nil?

    format_response response
  end

  private

  def retrieve_from_api
    response = self.class.get('', @options)
    response[@isbn]
  end

  def format_response(response)
    {
      ISBN: @isbn,
      title: response['title'],
      subtitle: response['subtitle'],
      number_of_pages: response['number_of_pages'],
      authors: response['authors'].map { |data| data['name'] }
    }
  end
end
