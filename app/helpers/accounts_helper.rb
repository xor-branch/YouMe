module AccountsHelper
  def profile_thumbnail account
    image_tag account.images.first, width:"40px", height:"40px", class:"float-left profile-thumb rounded-circle mr-3" if account.images.any?
  end

  def get_account_from_conversation conversation
    matched_account_id = conversation.sender_id == current_account.id ? conversation.recipient_id : conversation.sender_id
    @matches.select{ |account| account.id == matched_account_id }.first
  end
end
