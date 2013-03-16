class EventsController < ApplicationController
  before_filter :authenticate

  def events_test
    @events = Event.find(:all, :conditions => ["event_date > ?", Time.now], :limit => 30)
    @tags = Tag.find(:all, :order => ["num_events DESC"], :limit => 15)
  end

  def index
    @events = Event.find(:all, :conditions => ["event_date > ?", Time.now], :limit => 30)
    @tags = Tag.find(:all, :order => ["num_events DESC"], :limit => 15)
    if params[:eventID] != nil
      @eventID = params[:eventID]
    end
  end
  
  def new
    @event = Event.new
    1.times { @event.eventimages.build }
  end
  
  def list
    # @events = Event.find(:all, :conditions => ["event_date > ?", Time.now], :limit => 10)
    @events = Event.find(:all, :conditions => ["event_date > ?", Time.now], :limit => 10)
    @tags = Tag.find(:all, :order => ["num_events DESC"], :limit => 6)
    @abc = "return value"
  end

  def create
    _event = params[:event]
    
    _event["event_date"] = Time.parse(params[:event][:event_date].to_s)
    
    if params[:event][:end_date] != ''
      _event["end_date"] = Time.parse(params[:event][:end_date].to_s)
    end
    
    _event["date_created"] = Time.now
    _event["date_updated"] = Time.now
    
    _event["tag_ids"] = Array.new
    _tags = params[:tag].split(" ")
        
    _create = Event.new(_event)
     
    if _create.save
        for t in _tags 
          tag = Tag.where(:name => t).all
          unless tag.collect{|x| x.name}.include?(t)
            newTag = Tag.new
            newTag.name = t
            newTag.num_events = 1
            newTag.save
            _event[:tag_ids].push(newTag.id)
          else
            tag = Tag.where(:name => t).first
            tag.num_events = tag.num_events + 1
            tag.save
            tag_id = tag.id
            _event[:tag_ids].push(tag_id)
          end
        end
        
        _review = Review.new()
        _review.content=_create.theme.to_s + " " + _create.location.to_s
        _review.initiator_id=params[:user_id]
        _review.review_type=2
        _review.events_id = _create.id
        _review.save
          
        redirect_to :controller=>"events", :action=>"index"
    else
       render :controller => "events", :action => 'new'
    end  
  end
  
  
  def cal_list
    selected_date = Date.parse(params[:selected_date])
    
    if current_user.nil?
      redirect_to "/login"
    else
      @events = Event.where("cast(event_date as date) = ? ", selected_date)
    end
    render :layout => false
  end
  
  def selected_event_details
    event_id = params[:event_id]
    @event = Event.find(event_id)
    render :layout => false
  end
  
  def tag_filter
    unless params[:keywords].blank?
      limits = 15
      keywords = params[:keywords]
      sql = "select * from events e where e.id in (select distinct event_id from events_tags et where et.tag_id in (select t.id from tags t where t.name in ('#{keywords}'))) limit 0, #{limits}"
      @events = Event.find_by_sql(sql)
    else
      @events = Event.find(:all, :conditions => ["event_date > ?", Time.now], :limit => 15)
    end
    render :layout => false
  end

  def join_events
    _eventId = params[:eventId].to_i
    _event = Event.find(_eventId)
    if !(current_user.event_ids.include?(_eventId))
      current_user.events << _event
      Event.update(_eventId, :participants_num => (_event.participants_num + 1))        
    else
      current_user.events.delete(_event)
      Event.update(_eventId, :participants_num => (_event.participants_num - 1))
    end
    
    # render :text => "aaa"
    # render :nothing=>"true"
  end
  
  def follow_events
    
  end

end
