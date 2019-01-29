module Openlibrary
  module Works
    # Find book_works in Open Library by OLID, ISBN, LCCN, or OCLC
    #
    def book_work(olid)
      data = request("/works/#{olid}")

      Hashie.symbolize_keys!(data)
    end

    def book_work_by_isbn(isbn)
      type = "/type/edition"
      if isbn.length == 10
        data = query("type=#{type}&isbn_10=#{isbn}")
      elsif isbn.length == 13
        data = query("type=#{type}&isbn_13=#{isbn}")
      else
        raise ArgumentError, "ISBN must be 10 or 13 characters."
      end
    end

    def book_work_by_lccn(lccn)
      type = "/type/edition"
      data = query("type=#{type}&lccn=#{lccn}")
    end

    def book_work_by_oclc(oclc)
      type = "/type/edition"
      data = query("type=#{type}&oclc_numbers=#{oclc}")
    end
  end
end
