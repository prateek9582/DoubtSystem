class CommentsController < ApplicationController
    def create
        @question = Question.find(params[:question_id])
        @comment = @question.comments.create(comment_params)
        @comment.username = current_user.email.split('@')[0]
        @comment.save
        redirect_to root_path
    end
    private def comment_params
        params.require(:comment).permit(:body);
    end
end
