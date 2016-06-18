#class StaticPagesController < ApplicationController
class StaticPagesController < ActionController::Base

  layout 'materialhome'

  def home
  end

  def help
  	render :layout => 'material'
  end

  def about
  end

  def demo
  	#render :layout => false
  end

  def features
  end

  def pricing
  end

  def confirmation

  end
end
