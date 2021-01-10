class User < ApplicationRecord

  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable
  
  has_many :books, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_books, through: :likes, source: :book
  has_many :comments, dependent: :destroy

  def already_liked?(book)
    self.likes.exists?(book_id: book.id)
  end

end
