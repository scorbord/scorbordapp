class StaticPagesController < ApplicationController

  def home
  	render :layout => 'materialhome'
  end

  def help
  	render :layout => 'material'
  end

  def about
  end
  
  def demo
  	render :layout => false
  end

  def features
    render :layout => 'materialhome'
  end

  def pricing
    render :layout => 'materialhome'
  end
end
