require_relative '../controllers/my_rsas_controller.rb'
class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    message = Message.find_by id: params[:id2]
    if request.content_type =~ /json/
      render json: {message: message.content}
    end 
  end

  # GET /messages/new
  def new
    rsa = MyRsa.find_by id: params[:id]
    rsa_ = RSA.new(rsa.n, rsa.e, rsa.d)
    encrypted_message = rsa_.encrypt(params[:message])
    message = Message.new({content: encrypted_message})
    if request.content_type =~ /json/
      if message.save
        render json: {id: message.id}
      end
    end
  end

  def decrypt_messages
    rsa = MyRsa.find_by id: params[:id]
    rsa_ = RSA.new(rsa.n, rsa.e, rsa.d)
    decrypted_message = rsa_.decrypt(params[:message])
    if request.content_type =~ /json/
      render json: {message: decrypted_message}
    end
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content)
    end
end
