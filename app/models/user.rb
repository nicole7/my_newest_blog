class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :guest_comments, through: :comments, source: :post

  has_secure_password

  include ActiveModel::ForbiddenAttributesProtection

   def user_params
      params.require(:user).permit(:name, :email, :hashed_password)
    end
end
