class User < ApplicationRecord
  has_secure_password
  include ActiveModel::ForbiddenAttributesProtection

   def user_params
      params.require(:user).permit(:name, :email, :hashed_password)
    end
end
