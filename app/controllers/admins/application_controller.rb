class Admins::ApplicationController < ApplicationController
  layout 'admin/application'
  before_action :authenticate_admin!
  skip_before_action :authenticate_user!
end