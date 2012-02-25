class HomeController < ApplicationController
  before_filter :login_required, :except => [:privacy, :contact, :landing]
end
