require 'spec_helper'
module Multiprimes
  describe Printer do
    let(:table){PrimeTable.new( 10, 10 )}

    it 'responds to print_table' do
      expect(Printer).to respond_to :print_table
    end
    it 'raises an error when trying to print nothing' do
      expect{subject}.to raise_error ArgumentError
    end

    it 'raises an error when printing another thing than a table' do
      expect{Printer.new([1,2,3])}.to raise_error TypeError 
    end

    it 'prints correctly a table' do
      out = File.open(File.join(File.dirname(__FILE__), '../../support/output.txt')).read
      expect{Printer.print_table(table)}.to output(out).to_stdout
    end
  end
end
