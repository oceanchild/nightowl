class PrivatemessagesController < ApplicationController
  def index
    _sql = "select pm.subject, pm.body, pmi.sender_id from private_messages as pm, private_message_inbox as pmi where pmi.private_message_id = pm.id and pmi.user_id = '#{current_user[:id]}'"
    @messages = ActiveRecord::Base.connection.select_all(_sql)
    
    _sqlSent = "select pm.subject, pm.body, pmo.recipient_id from private_messages as pm, private_message_outbox as pmo where pmo.private_message_id = pm.id and pmo.user_id = '#{current_user[:id]}'"
    @messagesSent = ActiveRecord::Base.connection.select_all(_sqlSent)
  end

  def send_msg
    _receiver = params[:msg_to]
    _sender = current_user[:id]
    _title = params[:msg_title]
    _body = params[:msg_body]
   
   _pm = PrivateMessage.new()
    _pm.subject = _title
    _pm.body = _body
    if _pm.save
    # _pm.save
      _inbox = PrivateMessageInbox.new()
        _inbox.user_id = _receiver
        _inbox.sender_id = _sender
        _inbox.private_message_id = _pm.id
      _inbox.save#end of saving inbox
    
      _outbox = PrivateMessageOutbox.new()
        _outbox.user_id = _sender
        _outbox.recipient_id = _receiver
        _outbox.private_message_id = _pm.id
      _outbox.save#end of saving outbox
    end #end of saving the message
    
    redirect_to :action => 'index'
  end
  
  def create
    _receiver = params[:receiver]
    _sender = params[:id]
    _subject = params[:subject]
    _body = params[:body]
    
    _pm = PrivateMessage.new()
      _pm.receiver_id = _receiver
      _pm.sender_id = _sender
      _pm.subject = _subject
      _pm.body = _body
      _pm.message_status_id = 0
    _pm.save
    
    
    redirect_to :controller=>'privatemessages', :actions=>'index'
  end
end
