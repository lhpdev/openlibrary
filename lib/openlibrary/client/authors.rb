module Openlibrary
  module Authors
    # Find authors in Open Library by their key
    #
    def author(key)
      data = request("/authors/#{key}")
      Hashie.symbolize_keys!(data)
    end
  end
end
