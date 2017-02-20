class UiController < ApplicationController
  layout :choose_layout

  def not_found
    render :layout => 'blank'
  end

  def sessions
    render params[:page] ? "ui/sessions/#{params[:page]}" : "ui/sessions/index"
  end

  def team
    render params[:page] ? "ui/team/#{params[:page]}" : "ui/team/index"
  end

  private

  def choose_layout
    case action_name
    when /^email/
      "mailer"
    else
      "ui"
    end
  end

end
