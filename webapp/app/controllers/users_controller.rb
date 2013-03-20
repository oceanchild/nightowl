class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update]
  skip_before_filter :verify_authenticity_token, :only => [:event_details]
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save && @user.create_profile
      flash[:notice] = 'User successfully added.'
      # if params[:user][:image].blank?
        # redirect_to root_path
      # else
        # render :action => "crop"
      # end
      UserMailer.registration_confirmation(@user).deliver
      redirect_to :controller => 'sessions', :action => 'create', :email => params[:user][:email], :password => params[:user][:password]
    else
      @user.rollback
      render :action => 'new'
    end
  end
  
def index
    @all_events = Event.find_by_sql("select e.id,e.user_id,e.introduction,e.theme,e.event_date,e.date_created,u.nickname from events as e,users as u where e.user_id=u.id order by e.date_created desc")
    @event_users={}
    @all_events.each do |_event|
      @event_users[_event.id] = User.find_by_id(_event.user_id)
    end
  
    @review = Review.new() 
    # _all_reviews = Review.find(:all, :select=>"reviews.id, reviews.initiator_id, reviews.content, reviews.date_created", :order=>"reviews.date_created DESC", :limit=>20)
    _all_reviews = Review.find_by_sql("select reviews.id as id, reviews.initiator_id as initiator_id, reviews.content as content, reviews.image_file_name as image_file_name, reviews.image_content_type as image_content_type, reviews.image_file_size as image_file_size, reviews.date_created as date_created, users.nickname as nickname, '1' as time_diff from reviews, users where initiator_id = users.id order by reviews.date_created DESC")
    @paginated_reviews = Review.paginate_by_sql("select reviews.id as id, reviews.initiator_id as initiator_id, reviews.content as content, reviews.image_file_name as image_file_name, reviews.image_content_type as image_content_type, reviews.image_file_size as image_file_size, reviews.date_created as date_created, users.nickname as nickname, '1' as time_diff from reviews, users where initiator_id = users.id order by reviews.date_created DESC", :page => params[:page], :per_page => 15)
    @review_initiators = {}
    @paginated_reviews.each do |_paginated_reviews|
      @review_initiators[_paginated_reviews.initiator_id] = User.find_by_id(_paginated_reviews.initiator_id)
    end
    
    
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
    
    _time = Time.now
    @reviews = Array.new
    if _all_reviews != nil
      _all_reviews.each do |_review|
        _can_see_flag = false
        if _review.initiator_id == current_user[:id] #if me is the initiator
          _can_see_flag = true
        else
          @my_friends.each do |_friend|
            if _review.initiator_id == _friend
              _can_see_flag = true
            end
          end #end of inner loop 
        end
          
        
        if _can_see_flag == true
          @reviews.push(_review)
        end
      end
    end
  
  end
  
  def edit
    @user = current_user
    # @user_id = params[:id]
    # @user = User.find(:all, :conditions => ["id=?", @user_id])
    @u_email = @user.collect{|x| x.email}[0]
    @u_nickname = @user.collect{|x| x.nickname}[0]
    @u_friends_num = @user.collect{|x| x.friends_num}[0]
    @u_fans_num = @user.collect{|x| x.fans_num}[0]
    @u_follow_num  = @user.collect{|x| x.follow_num }[0]
  end
  
  def update
    # @user = current_user
    # _user_id = params[:id]
    # _new_email = params[:u_email]
    # _new_nickname = params[:u_nickname]
#     
    # _user = User.find(_user_id)
    # _user.email = _new_email
    # _user.nickname = _new_nickname
    # _user.save
#     
    # redirect_to :controller=>'users', :actions=>'edit', :id=>'100'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      if params[:user][:image].blank?
        flash[:notice] = "Successfully updated user."
        redirect_to @user
      else
        render :action => "crop"
      end
    else
      render :action => 'edit'
    end
    
  end
  
  def event_details
    @selected_event = Event.find_by_id(params[:eid])
  end
  
  def get_message
    @reviews = Review.find(:all, :select=>"initiator_id, content", :order=>"date_created DESC", :limit=>10)
    text = 'huahua gong zuo'
    render :text => 'bad bad'
  end
  
  def update_crop
    @user = Product.find(params[:id])
    @user.crop(params[:crop_x].to_i, params[:crop_y].to_i, params[:crop_h].to_i, params[:crop_w].to_i)

    redirect_to( @user , :notice => 'Your profile and avatar was successfully updated.')
  end
  
  def autocomplete_users

    if keyword = params[:nickname].split("@").last
      @nicknames = User.where("lcase(nickname) like '%#{keyword.downcase}%'").limit(10).collect{|x| x.nickname}
    end
    render :layout => false
  end
  
  def autocomplete_users_friends

    if keyword = params[:nickname]
      @nicknames = User.where("lcase(nickname) like '%#{keyword.downcase}%'").limit(10).collect{|x| x.nickname}
    end
    render :layout => false
  end
  
  def show
    @user = User.find(params[:id])
  end

  def editprofile
    _profile = Profile.find(:first, :conditions => ["user_id=?", current_user[:id]], :limit => 1)
    
    if _profile != nil
      @profile = _profile
      # @profile[:object] = Hash.new()
      # @profile[:object]["province_id"] = @profile["province_id"]
    else
      @profile = Profile.new
    end
  end
  
  def saveprofile
    _profile = Profile.find(:first, :conditions => ["user_id=?", current_user[:id]])
    # params[:profile]["province_id"] = params[:object]["province_id"]
    # params[:profile]["city_id"] = params[:object]["city_id"]
    
    if _profile != nil
      if _profile.update_attributes(params[:profile])
        redirect_to :action => "editprofile"
      end
    else
      if Profile.new(params[:profile]).save
        redirect_to :action => "editprofile"
      end
    end
  end
  
  def test_create
    @review = Review.create(params[:review])
    @reviews = Review.all(:order => "date_created DESC")
    if @review.save
      respond_to do |format|
        format.html {render '_review_saved.html.erb', :layout => false}
      end
    else
      respond_to do |format|
        format.html {render '_review_unsaved.html.erb'}
      end
    end
    
  end

  def indext
    @all_reviews = Review.paginate_by_sql("select reviews.id as id, reviews.initiator_id as initiator_id, reviews.content as content, reviews.image_file_name as image_file_name, reviews.image_content_type as image_content_type, reviews.image_file_size as image_file_size, reviews.date_created as date_created, users.nickname as nickname, '1' as time_diff from reviews, users where initiator_id = users.id order by reviews.date_created DESC", :page => params[:page], :per_page => 15)
  end
  
  def more_streams
    @more_reviews = Review.paginate_by_sql("select reviews.id as id, reviews.initiator_id as initiator_id, reviews.content as content, reviews.image_file_name as image_file_name, reviews.image_content_type as image_content_type, reviews.image_file_size as image_file_size,reviews.date_created as date_created, users.nickname as nickname, '1' as time_diff from reviews, users where initiator_id = users.id order by reviews.date_created DESC", :page => params[:page], :per_page => 15)
    @review_initiators = {}
    @more_reviews.each do |_more_reviews|
      @review_initiators[_more_reviews.initiator_id] = User.find_by_id(_more_reviews.initiator_id)
    end
    render :action => "more_streams", :layout => "layouts/partial"
  end
  
  def atme_streams
    @atmestreams = current_user.reviews.order("date_created DESC")
    render :partial => 'atme_streams'
  end
  
  def follow_events    
    if params[:id] == nil
      @events = Event.find(:all, :conditions => ["event_date > ?", Time.now], :limit => 20)
    else
      _event = Event.find(params[:id])
      if !(current_user.event_ids.include?(params[:id].to_i))
        current_user.events << _event
        Event.update(params[:id], :participants_num => (_event.participants_num + 1))        
      else
        current_user.events.delete(_event)
        Event.update(params[:id], :participants_num => (_event.participants_num - 1))
      end
      @events = Event.find(:all, :conditions => ["event_date > ?", Time.now], :limit => 20)
    end    
  end
  
end
