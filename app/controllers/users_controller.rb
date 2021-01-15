class UsersController < ApplicationController
    def show

            @user = User.find(params[:id])

    end

    def mypost
        @user = User.find(params[:id])
        @user_post = @user.books.all.page(params[:page]).per(2)
    end
    
    #デフォルトで画像を設定する方法
    #https://qiita.com/Toshimatu/items/a6382efd410fe5544406
    def create
        @user = User.new(user_params)
        #デフォルトで画像を設定しておく。
        @user.image = "book1.jpg"
            if @user.save
                redirect_to post_path, success: '登録ができました。'
            else
                flash.now[:danger] = "登録に失敗しました"
                render :new
            end
    end

    private
    def user_params
        params.require(:user).permit(:name,:password, :password_confirmation, :image)
    end
end
