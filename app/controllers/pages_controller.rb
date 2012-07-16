class PagesController < ApplicationController
  def main
    redirect_to email_histories_path
  end
end
