require 'spec_helper'

describe Prime do
  context '#first' do
    it "respond to first" do
      expect(Prime).to respond_to :first
    end
    it "without argument returns the first prime number" do
      expect(Prime.first).to eq 2
    end
    it "with an argument returns an array" do
      expect(Prime.first(3)).to be_an Array
    end
    it "returns an array of n prime numbers" do
      expect(Prime.first(3)).to eq [2, 3, 5]
    end
    it "raises an error when argument is not a number" do
      expect{Prime.first('a')}.to raise_error TypeError
    end
  end
  context '#each' do
    it "yields prime numbers" do
      prime = double
      allow(prime).to receive(:each).with(:b).and_yield([2,3,5])
      expect{|b| prime.each(&b).to yield([2,3,5])}
    end

  end
end
