class HomeController < ApplicationController
  before_filter :login_required, :except => [:privacy, :contact, :landing]
  layout nil
  layout 'application', :except => :landing
  authorize_resource :only => :admin, :class => false

end
