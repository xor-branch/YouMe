class PublicController < ApplicationController

  def home
   redirect_to browse_path if account_signed_in?
  end

end
