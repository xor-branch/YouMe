class Match < ApplicationRecord
  validates_uniqueness_of :account_1, scope: :account_2

  scope :between, -> (account_1, account_2) do
   where('(account_1 = ? AND account_2 = ?) OR (account_1 = ? AND account_2 = ?)', account_1, account_2, account_2, account_1)
  end

  scope :matches_for, -> id do
    matches = where("(account_1 = ? OR account_2 = ?) AND (account_1_approves = ? AND account_2_approves = ?)",id,id, true, true)

    account_ids = []
    matches.each do |match|
      new_id = match.account_1 == id ? match.account_2 : match.account_1
      account_ids << new_id
    end

    Account.where(id: account_ids)
  end

  scope :recommendation_for, -> id do
    # les ids a ignorer
    matches = where("(account_1 = ? AND account_1_approves IS NOT NULL) OR (account_2 = ? AND account_2_approves IS NOT NULL)", id, id)

    ignore_ids = [id]
    matches.each do |match|
      new_id = match.account_1 == id ? match.account_2 : match.account_1
      ignore_ids << new_id
    end

    Account.includes(:images_attachments).where.not(id: ignore_ids).limit(10)
  end
end
