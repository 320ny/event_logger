class UsersController < ApplicationController

  def create
    log_event('user_created_success')
  end

end
