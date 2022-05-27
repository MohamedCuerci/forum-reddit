class CommentsController < ApplicationController

    def create
        @message = Message.find(params[:message_id])
        @comment = @message.comments.create(comment_params)
        @comment.user_id = current_user.id
        

        if @comment.save
            flash[:success] = "Artigo criado com sucesso"
            redirect_to @message
        else
            flash[:error] = "Alguma coisa deu errado"
            render 'message/new', status: :unprocessable_entity
        end
    end

    private 
        def comment_params
            params.require(:comment).permit(:content)
        end
end
