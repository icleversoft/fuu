require 'terminal-table'
module Multiprimes
  class PrimitivePrinter
    def initialize( table = nil )
      raise ArgumentError.new("You should initialize with a Table") unless table
      raise TypeError.new("No implicit conversion of #{table.class} into Table") unless table.is_a? Table
      @table = table
    end
    def print
      puts @printer if @printer
    end
  end

  class Printer < PrimitivePrinter
    class << self
      def print_table( table )
        Printer.new( table ).print
      end
    end

    def initialize( table )
      super
      prepare_printer
      render_table
    end

    private
    def prepare_printer
      Terminal::Table::Style.defaults[:alignment] = :right
      @printer = Terminal::Table.new
    end

    def render_table
      @printer.add_row @table.top_row
      @printer.add_separator
      @table.each_row{|row| @printer.add_row row}
    end
  end
end
