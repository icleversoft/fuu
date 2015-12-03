module Multiprimes
  class Table
    def initialize( col_numbers = [], row_numbers = [])
      raise ArgumentError if col_numbers.empty? || row_numbers.empty? 
      @col_numbers, @row_numbers = col_numbers, row_numbers

      @rows = []
    end

    def top_row
      [' '].concat( @row_numbers )
    end
    

    def each_row(&block)
      rows.each(&block)
    end

    private
    def rows
      @rows.empty? ? calc_rows : @rows
    end

    def calc_rows
      @col_numbers.each(&row)
      @rows
    end

    def row
      ->(no){@rows << [no].concat(@row_numbers.collect(&multiply_elements_with(no)))}
    end

    def multiply_elements_with( no )
      ->(x){ x * no }
    end

  end

  class PrimeTable < Table
    def initialize( cols = 0, rows = 0 )
      raise ArgumentError if cols * rows == 0
      super( Prime.first( cols ), Prime.first( rows ) )
    end
  end
end
