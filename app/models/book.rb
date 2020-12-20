class Book < ApplicationRecord
    mount_uploader :image, ImageUploader

    belongs_to :user
    has_many :comments, dependent: :destroy

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

    def liked?(like_user_id,like_food_id)
        likes.where(user_id: like_user_id, book_id: like_book_id).exists?
    end
    
end
