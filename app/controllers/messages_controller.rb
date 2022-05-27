class MessagesController < ApplicationController
    before_action :set_message, only: [:show, :edit, :update, :destroy ]

    def index
        @messages = Message.all.order("created_at DESC")
    end

    def show
    end

    def new
        @message = current_user.messages.build
    end

    def create
        @message = current_user.messages.build(message_params)

        if @message.save
            redirect_to @message
        else
            redirect_to :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @message.update(message_params)
            redirect_to @message
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @message.destroy
        redirect_to root_path, status: :see_other
    end

    private
        def set_message
            @message = Message.find(params[:id])
        end

        def message_params
            params.require(:message).permit(:title, :description)
        end
end
