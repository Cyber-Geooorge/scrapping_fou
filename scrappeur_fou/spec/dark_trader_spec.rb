require_relative '../lib/dark_trader.rb/'

describe "produce" do
  it "array with name and value of coin" do
    expect(produce[0]).to eq("BTC"=>"$23,100.97")
end
end