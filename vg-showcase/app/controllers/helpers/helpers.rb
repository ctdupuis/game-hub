require 'sinatra/base'

class Helpers

  def self.current_user(session)
    @user = User.find_by_id(session[:user_id])
  end

  def self.is_logged_in?(session)
    !!session[:user_id]
  end

  def self.validate_length(password)
    password.length >= 4
  end

  def self.validate_user(user)
    user =~ /^[A-Z0-9]+$/i && Helpers.validate_length(user)
  end

  def self.validate_studio(studio)
    studio =~ /^[A-Z0-9]/i
  end
    
end