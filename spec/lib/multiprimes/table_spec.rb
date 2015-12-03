require 'spec_helper'

describe Multiprimes::Table do

  let(:table){Multiprimes::Table.new([1, 2, 3], [1, 2, 3, 4])}

  it "raises an exception when either cols or rows are empty tables" do
    expect{Multiprimes::Table.new([], [])}.to raise_error ArgumentError
  end

  context '#top_row' do
    it 'responds to top_row' do
      expect(table).to respond_to :top_row
    end

    it 'returns an array' do
      expect(table.top_row).to be_an Array
    end

    it 'returns correctly an array with an empty element followed by the contents of row_numbers' do
      expect(table.top_row).to eq [' ', 1, 2, 3, 4]
    end
  end

  context '#each_row' do
    it 'responds to each_row' do
      expect(table).to respond_to :each_row
    end
    it 'yields 3 times' do
      expect{|b| table.each_row(&b)}.to yield_control.exactly(3).times 
    end

    it 'each yielded row is an array' do
      expect{|b| table.each_row(&b)}.to yield_successive_args(Array, Array, Array) 
    end

    it 'each yielded array contains the right data' do
      expect{|b| table.each_row(&b)}.to yield_successive_args([1, 1, 2, 3, 4], [2, 2, 4, 6, 8], [3, 3, 6, 9, 12]) 
    end
  end
end

describe Multiprimes::PrimeTable do
  let(:prime_table){Multiprimes::PrimeTable.new(3, 3)}

  it "inherits from Table" do
    expect(prime_table).to be_an Multiprimes::Table
  end

  it "raises an error when invalid arguments are passed" do
    expect{subject}.to raise_error ArgumentError
  end

  context '#top_row' do
    it "contains the right data" do
      expect(prime_table.top_row).to eq [' ', 2, 3, 5]
    end
  end
  context '#each_row' do
    it 'yields the right data' do
      expect{|b| prime_table.each_row(&b)}.to yield_successive_args([2, 4, 6, 10], [3, 6, 9, 15], [5, 10, 15, 25]) 
    end
  end

end
