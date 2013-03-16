class ReviewsController < ApplicationController
  
  def display
    # @reviews=Review.find(:all, :select=>"initiator_id, content")
    
    # render :nothing=>true;
  end
  
  def delete
    _review = Review.find_by_id(params["review_id"].to_i)
    _review.destroy
    
    render :nothing => true
    # redirect_to :controller=>'users', :actions=>'index'
  end
  
  def save
    @review = Review.create(params[:review])
    @review.save
    @new_id = @review.id
    # render :nothing => true
    # render :text=>'saved'
    render :partial => "save"
  end
  
  #incoming_message is used to render new message. Called from User/index Ajax
  def new_message
    _message = params[:message]
    _atusers = params[:message].split("@")
    _atuser_nicknames = Array.new
    for _atuser in _atusers
      _atuser_nickname = _atuser
      _user = nil
      if _atuser.index(/\s/)
        _atuser_nickname = _atuser[0, _atuser.index(/\s/)] 
      end
      
      _user = User.where("nickname = '#{_atuser_nickname}'")
      unless _user.blank?
        _message = _message.gsub( "@"+_atuser_nickname, "<a href=\"#{users_path}/show/#{_user[0].id}\">@"+ _atuser_nickname + "</a> ")
        _atuser_nicknames.push(_atuser_nickname)
      end
    end
    _nicknames = _atuser_nicknames.join("','")
    _review = Review.new()
      _review.content= _message
      _review.initiator_id = current_user[:id]
      _review.review_type=2
      userids = User.where("nickname in ('#{_nicknames}')")
      _review.users << userids
    if _review.save
      _saved_review = Review.find(:all, :conditions=>['content=? and initiator_id=?',_message, current_user[:id]], :order=>"date_created DESC")
      @review_id = _saved_review.collect{|x| x.id}[0]
      @initiator = current_user[:id]
      @reviews = params[:message]
      @reviewdate = _saved_review.collect{|x| x.date_created}[0]
    end
    render :partial => 'incomingmessage' #, :local => {:message => _reviews}
    # render :nothing => true
  end
  
  #read latest messages from database and pass them to views
  def get_message
    
    _all_reviews = Review.find(:all, :select=>"id, initiator_id, content, date_created", :conditions=>['date_created >= ? and id != ?', Time.now, params[:lastmsg_id]], :limit=>10)    
    # @reviews = Review.find(:all, :select=>"id, initiator_id, content, date_created", :conditions=>['date_created >= ? and id != ?', params[:lastmsg_date], params[:lastmsg_id]], :limit=>10)
    @my_friends = Array.new()
    _my_frends= Friend.find(:all, :select => "friend1_id, friend2_id", :conditions => ["friend1_id=? or friend2_id=?", current_user[:id], current_user[:id]], :limit => current_user[:_friend_num])
    _my_frends.each do |_friend|
      if _friend.friend1_id == current_user[:id]
        @my_friends.push(_friend.friend2_id)
      elsif _friend.friend2_id == current_user[:id]
        @my_friends.push(_friend.friend1_id)
      end
    end

    @reviews = nil
    _all_reviews.each do |_review|
      _can_see_flag = true
      @my_friends.each do |_friend|
        if _review.initiator_id == _friend
          _can_see_flag = true
        end
      end #end of inner loop
      if _can_see_flag == true
        @reviews.push(_review)
      end
    end
    render :partial => 'outgoingmessage'
  end
  
  def atme
    @reviews = current_user.reviews.order("date_created DESC")
  end
  
  def savereview
    @test = params[:review]
    if Review.new(params[:review]).save
      redirect_to :controller=>'users', :actions=>'test'
    end
  end
  
  def listreview
    @reviews = Review.find(:all, :limit=>20)
  end
  
  def save_review
    #called from user index ajax, when publish a new message
    
    render :nothing => true
  end
  
end








