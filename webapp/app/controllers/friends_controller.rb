class FriendsController < ApplicationController
  before_filter :authenticate
  
  
  def index
    @user_id = current_user[:id]
    @my_friends = Array.new()
    @pending_friends = Array.new()
    @black_friends = Array.new()
    _friend_num = User.find(@user_id).friends_num
    _str_userid = ''
    _str_pending = ''
    
    _friends = Friend.find(:all, :select => "friend1_id, friend2_id", :conditions => ["friend1_id=? or friend2_id=?", @user_id, @user_id], :limit => _friend_num)
    _friends.each do |_friend|
      if _friend.friend1_id == @user_id
        if _str_userid.length != 0
          _str_userid = _str_userid + ',' + _friend.friend2_id.to_s
        else _str_userid = _friend.friend2_id.to_s
        end       
      elsif _friend.friend2_id == @user_id
        if _str_userid.length != 0
          _str_userid = _str_userid + ',' + _friend.friend1_id.to_s
        else _str_userid = _friend.friend1_id.to_s
        end
      end
    end
    
    if _str_userid.length != 0
      @my_friends = User.find(:all, :select=>"id, nickname, friends_num", :conditions=>["id in (#{_str_userid})"]).collect{|x| [x.id, x.nickname, x.friends_num]  }
    end
    
    _pending_friends = FriendsPending.find(:all, :select =>"requestor_user_id", :conditions => ["acceptor_user_id=?", @user_id])
    
    if _pending_friends.length != 0
      _pending_friends.each do |_pending_friend|
        if _str_pending.length != 0
          _str_pending = _str_pending + ',' + _pending_friend.requestor_user_id.to_s
        else _str_pending = _pending_friend.requestor_user_id.to_s
        end
        
      end
      @pending_friends =  User.find(:all, :select=>"id, nickname, friends_num", :conditions=>["id in (#{_str_pending})"]).collect{|x| [x.id, x.nickname, x.friends_num]  }
    end

  end
  
  def new
    @user_id = current_user[:id]
  end
  
  def pending
    @user_id = current_user[:id]
    # _target_id = User.find(:first, :select=>"id", :conditions=>["nickname=?", params[:target_user].to_s])
    _pendfriend = FriendsPending.new()
      _pendfriend.requestor_user_id = current_user[:id]
      _pendfriend.acceptor_user_id = params[:target_user] #_target_id[0]
      _pendfriend.message = '' #params[:message]
    _pendfriend.save
    
    redirect_to :controller=>'friends', :actions=>'index', :id=>@user_id
  end
  
  def create
    _target = params[:target_user]
    
    _friend = Friend.new()
      _friend.friend1_id = current_user[:id]
      _friend.friend2_id = params[:target_user]
    #---Above is to add pending friend to friend
    #---Below is to remove target user from pending list if save is successful
    if _friend.save
      if increment_friend_num(current_user[:id], params[:target_user]) == true
        ActiveRecord::Base.connection.delete"DELETE FROM friends_pending_list WHERE acceptor_user_id = #{params[:id]} and requestor_user_id = #{params[:target_user]}"
      end
    end
       
    redirect_to :controller=>'friends', :actions=>'index', :id => params[:id]
  end
  
  def add_to_blacklist
    @user_id = current_user[:id]
    
    _blackfriend = FriendsBlack.new()
      _blackfriend. user_id = current_user[:id]
      _blackfriend.blocked_user_id = params[:add_black_user]
    #---Above is to add friend to black list
    #---Below is to remove target from friends list if save is successful
    if  _blackfriend.save
      ActiveRecord::Base.connection.delete"DELETE FROM friends WHERE (friend1_id = #{params[:id]} and friend2_id = #{params[:add_black_user]}) or (friend2_id = #{params[:id]} and friend1_id = #{params[:add_black_user]})"
    end
    
    redirect_to :controller=>'friends', :actions=>'index', :id => params[:id]
  end
  
  def delete
    @user_id = current_user[:id]
    if decrement_friend_num(params[:id], params[:delete_user]) == true
      ActiveRecord::Base.connection.delete"DELETE FROM friends WHERE (friend1_id = #{params[:id]} and friend2_id = #{params[:delete_user]}) or (friend2_id = #{params[:id]} and friend1_id = #{params[:delete_user]})"
    end
      
    redirect_to :controller=>'friends', :actions=>'index', :id => params[:id]
  end
  
  def edit
    @user_id = current_user[:id]
    @user = User.find(:all, :conditions => ["id=?", @user_id])
    @u_email = @user.collect{|x| x.email}[0]
    @u_nickname = @user.collect{|x| x.nickname}[0]
    @u_friends_num = @user.collect{|x| x.friends_num}[0]
    @u_fans_num = @user.collect{|x| x.fans_num}[0]
    @u_follow_num  = @user.collect{|x| x.follow_num }[0]
  end
  
  def update
    _user_id = current_user[:id]
    _new_email = params[:u_email]
    _new_nickname = params[:u_nickname]
    
    _user = User.find(_user_id)
    _user.email = _new_email
    _user.nickname = _new_nickname
    _user.save
    
    redirect_to :controller=>'users', :actions=>'edit', :id=>'100'
  end
  
  def increment_friend_num(user_id, target_id)
    _user = User.find(user_id)
    _user.friends_num = _user.friends_num + 1
    _target = User.find(target_id)
    _target.friends_num = _target.friends_num + 1
    if _user.save and _target.save
      return true
    end
      return false
  end
  
  def decrement_friend_num(user_id, target_id)
    _user = User.find(user_id)
    _user.friends_num = _user.friends_num - 1
    _target = User.find(target_id)
    _target.friends_num = _target.friends_num - 1
    if _user.save and _target.save
      return true
    end
      return false
  end
  
  def quick_search
    
    
    render :partial => 'nickname_list'
  end
  
  def search_friend
    _input = params[:message]
    _friend_num = current_user[:friend_num]
    _str_userid = ''
    
    _friends = Friend.find(:all, :select => "friend1_id, friend2_id", :conditions => ["friend1_id=? or friend2_id=?", current_user[:id], current_user[:id]], :limit => _friend_num)
    _friends.each do |_friend|
      if _friend.friend1_id == current_user[:id]
        if _str_userid.length != 0
          _str_userid = _str_userid + ',' + _friend.friend2_id.to_s
        else _str_userid = _friend.friend2_id.to_s
        end       
      elsif _friend.friend2_id == current_user[:id]
        if _str_userid.length != 0
          _str_userid = _str_userid + ',' + _friend.friend1_id.to_s
        else _str_userid = _friend.friend1_id.to_s
        end
      end
    end
    
    if _str_userid.length != 0
      @matched_friends = User.find(:all, :conditions=>["id in (#{_str_userid}) and nickname like ?", _input+'%'])
    end

    render :partial => 'search_result'
  end
  
  def detail_search
    @list_results = Array.new()
    _nickname = params[:nickname]
    _email = params[:email]
    
    if _nickname !=nil and _email !=nil
      @list_results = User.find(:all, :conditions=>["nickname like ? and email like ?", '%'+_nickname+'%', '%'+_email+'%'])
    elsif _nickname != nil
      @list_results = User.find(:all, :conditions=>["nickname like ?", '%'+_nickname+'%'])
    elsif _email != nil
      @list_results = User.find(:all, :conditions=>["nickname like ?", '%'+_email+'%'])
    end
    
    render :partial => 'detail_search_result'
  end

end







