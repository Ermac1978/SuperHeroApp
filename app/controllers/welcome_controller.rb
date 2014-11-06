class WelcomeController < ApplicationController
  skip_before_action :authenticate, only: [:index, :signin, :signup]


  def index
  end

  def signup
    user = User.new(name: params[:name],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "You have now signed up, awesome job!"
    else
      flash[:error] = "Dude, come on?!"
    end
    redirect_to root_path
  end

  def signin

    user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

    if user
      session[:user_id] = user.id
      flash[:notice] = "Congrats, you signed in!"
    else
      session[:user_id] = nil
      flash[:error] = "No credentials found"
    end
    redirect_to super_heros_path

  end

  def signout
    session[:user_id] = nil
    flash[:warning] = "YOU SIGNED OUT!"
    redirect_to root_path
  end




end
