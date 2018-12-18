module Openlibrary
  module Editions
    # Get the editions of a work
    #
    def editions(work, limit=10, offset=0)
      data = request("/works/#{work}/editions.json?limit=#{limit}&offset=#{offset}")
      editions = Hashie.symbolize_keys!(data)
    end
  end
end
