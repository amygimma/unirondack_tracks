class RegistrationsController < ApplicationController

  before_filter_prepend :redirect_signup_path, only: [:new, :create]

  private

  def redirect_signup_path
    redirect_to root_path
  end
end
