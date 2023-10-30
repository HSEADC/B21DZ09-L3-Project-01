class WelcomeController < ApplicationController
  def index
    @sub = Subscription.new
  end

  def about 

  end

  def contacts
pp params
  end
end
