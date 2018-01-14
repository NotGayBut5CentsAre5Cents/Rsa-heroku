require 'rails_helper'
RSpec.describe MyRsasController do
	it "test" do
		expect(true).to eq(true)
	end
	it "rsa new test without keys" do
		post :new, as: :json
		id = JSON.parse(response.body)["id"]
		expect(MyRsa.where(id: id)).to exist
	end
	it "rsa new with given keys" do
		post :new, as: :json, params: {n: 3233, e: 17, d: 413}
		id = JSON.parse(response.body)["id"]
		expect(MyRsa.where(id: id)).to exist
		rsa = MyRsa.find_by(id: id)
		expect(rsa.n.to_i).to eq 3233
		expect(rsa.e.to_i).to eq 17
		expect(rsa.d.to_i).to eq 413
	end
	it "get rsa by agiven id" do
		post :new, as: :json, params: {n: 3419209, e: 3, d: 569251}
		id = JSON.parse(response.body)["id"]
		expect(MyRsa.where(id: id)).to exist
		get :show, as: :json, params: {id: id}
		n = JSON.parse(response.body)["n"]
		e = JSON.parse(response.body)["e"]
		d = JSON.parse(response.body)["d"]
		expect(n.to_i).to eq 3419209
		expect(e.to_i).to eq 3
		expect(d.to_i).to eq 569251
	end
	
end