require_relative '../lib/mairie_christmas.rb'

describe "get_cityhall_url" do
  it " return  city hall" do
    expect(get_cityhall_url[1]).to eq("Aincourt")
end
end

describe "produce" do
  it " return array of hashes name and mail of city hall " do
    expect(produce[1]).to eq({"Aincourt"=>"mairie.aincourt@wanadoo.fr"})
    
end
end