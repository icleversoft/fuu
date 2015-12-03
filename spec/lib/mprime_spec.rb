require 'spec_helper'

describe "mprime" do
  let(:cmd){IO.popen(File.join(File.dirname(__FILE__), '../../bin/mprimes')).read}
  it "prints correctly the output" do
    output = "\nUsage: mprimes --count size\nie: mprimes --count 10\n\n"
    expect(cmd).to eq output
  end
end
