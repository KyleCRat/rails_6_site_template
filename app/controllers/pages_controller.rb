class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    authorize :page
  end

  def show
    authorize :page
    render template: "pages/#{params[:page]}"
  end
end
