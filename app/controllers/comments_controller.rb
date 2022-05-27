class CommentsController < ApplicationController

    def create
        @message = Message.find(params[:message_id])
        @comment = @message.comments.create(comments_params)
        @comment.user_id = current_user.user_id

        if @comment.save
            redirect_to message_path(@message)
        else
            render "new"
        end
    end

    private 
        def comments_params
            params.require(:comments).permite(:content)
        end
end
