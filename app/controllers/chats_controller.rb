class ChatsController < ApplicationController
    before_action :set_message, only: %i[ show edit update destroy ]
      
    def index
        @chats = Chat.all
        @chat = Chat.new 
    end
    
    def show
    end
    
    def new
        @chat = Chat.new
    end

    # GET /messages/1/edit
    def edit
    end
    
    def create
        #inding.pry # 追加
        @chat = Chat.new(chat_params)
        
        respond_to do |format|
        if @chat.save
            format.html { redirect_to @chat } 
            format.js  
        else
            format.html { render :new } 
            format.js { render :errors } 
        end
    end
    end
    
    private
    def set_chat
      @chat = Chat.find(params[:id])
    end

    def chat_params
      params.require(:chat).permit(:message)
    end
end
