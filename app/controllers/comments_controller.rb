class CommentsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        book = Book.find(params[:book_id])
        #buildを使い,contentとtweet_idの二つを同時に代入
        comment = book.comments.build(comment_params)
        comment.user_id = current_user.id

        if comment.save
            flash[:success] = "コメントしました"
            redirect_back(fallback_location: root_path)
        else
            flash[:success] = "コメントできませんでした"
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        redirect_to("/books/#{params[:book_id]}")
    end

    private
        def comment_params
            params.require(:comment).permit(:content,:title,:rate)
        end

end
