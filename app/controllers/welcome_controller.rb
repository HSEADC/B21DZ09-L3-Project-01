class WelcomeController < ApplicationController
  def index
    @sub = Subscription.new
  end

  def about 
    @sub = Subscription.new
  end

  def contacts
pp params
  end
end
