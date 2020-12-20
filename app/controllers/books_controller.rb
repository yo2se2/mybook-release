class BooksController < ApplicationController
 
    
    def index 
    end

    def ranking
        #いいねの数でランキング分け
        # books_like_count = Book.joins(:likes).group(:book_id).count
        # book_liked_ids = Hash[books_like_count.sort_by{ |_, v| -v }].keys
        # @books_like = Book.where(id: book_liked_ids)

        @like_rank = Book.find(Like.group(:book_id).order('count(book_id) desc').limit(5).pluck(:book_id))
        
    def ranking2
        @comment_rank = Book.find(Comment.group(:book_id).order('count(book_id) desc').limit(5).pluck(:book_id))
    end
    end

    def favorite
        @books = Book.all.page(params[:page]).per(3)

    end 

   
    
    def new
        @book = Book.new
    end

    def create
        book = Book.new(book_params)

        book.user_id = current_user.id
        if book.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end

    end
   

    def show
       
        @book = Book.find(params[:id])

        #bookにアソシエーションで紐づいているコメントを読み込む
        @comments = @book.comments
        #新しいコメントを入れるための変数
        @comment = Comment.new
        @avg_rate = @book.comments.average(:rate).round(1)

    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        book = Book.find(params[:id])
        if book.update(book_params)
          redirect_to :action => "show", :id => book.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to action: :index         
    end

   
    private
        def book_params

            params.require(:book).permit(:body, :image, :name)
        end

end
