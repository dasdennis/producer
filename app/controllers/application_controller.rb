class ApplicationController < ActionController::Base
  protect_from_forgery
  
  respond_to :html, :json, :xml, :js
  
  before_filter :set_locale
  
private
  
  def set_locale
    I18n.locale = params[:locale] || :en
  end
  
end
