class MessagesController < ApplicationController
  before_action :authenticate_admin!, except: [:next, :index]
  before_action :set_message, only: [:edit, :update, :destroy]
  before_action :set_messages, only: [:index, :admin]

  def index
  end

  def admin
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to admin_messages_path, notice: 'Message was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to admin_messages_path, notice: 'Message was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @message.destroy

    redirect_to admin_messages_path notice: 'Message deleted'
  end

  def next
    @message = Message.next_message
    respond_to do |format|
      format.json { render json: @message }
      format.js { render action: 'next' }
    end
  end

  private

    def message_params
      params.require(:message)
        .permit(:body, :start_date)
    end

    def set_message
      @message = Message.find(params[:id])
    end

    def set_messages
      @messages = Message.all
    end
end
