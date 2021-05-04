class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many_attached :images

  def matches
    liked_account_ids = Like.where(account_id: self.id).map(&:liked_account_id)
    like_me_account_ids = Like.where(liked_account_id: self.id).map(&:account_id)

    matched_ids = liked_account_ids.select{|id| like_me_account_ids.include?(id)}

    Account.where(id: matched_ids)
  end
end
