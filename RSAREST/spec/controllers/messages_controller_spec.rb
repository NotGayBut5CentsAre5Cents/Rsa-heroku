RSpec.describe MessagesController do
	it "create message " do
		post :new, as: :json, params: {id: 1, message: "please let me live"}
		id2 = JSON.parse(response.body)["id"]
		expect(Message.where(id: id2)).to exist
	end

	it "return encrypted message" do
		post :new, as: :json, params: {id: 1, message: "zdr"}
		id2 = JSON.parse(response.body)["id"]
		get :show, as: :json, params: {id: 1, id2: id2}
		message_encrypted = JSON.parse(response.body)["message"]
		expect(message_encrypted.to_s).to eq "259311.2088738.3731020"
	end
	it "encrypt and decrypt a message" do
		post :decrypt_messages, as: :json, params: {id: 1, message:"259311.2088738.3731020"}
		message_decrypted = JSON.parse(response.body)["message"]
		expect(message_decrypted.to_s).to eq "zdr"
	end
end