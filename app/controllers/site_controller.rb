class SiteController < ApplicationController
  before_filter :authorize_user, except: :index
  def index
    @user = current_user
  end
end
