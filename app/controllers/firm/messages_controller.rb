class Firm::MessagesController < ApplicationController
  layout 'firm'
  def inbox
    @message = Message.where(firm_info_id: current_user.firm_info_id).order("created_at desc")

  end
end