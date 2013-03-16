class TagsController < ApplicationController
  before_filter :authenticate, :only => [:follow_tag]
  def list
    id = params[:id]
    @tag = Tag.find(id)
    
  end
  
  def tag_cloud
    @tags = Tag.order("num_events DESC").limit(20)
  end
  
  def autocomplete
    if keyword = params[:name]
      @tags = Tag.where("lcase(name) like '%#{keyword.downcase}%'").limit(10).collect{|x| x.name}
    end
    render :layout => false
  end
  
  def follow_tag
    unless current_user.blank?
      @tags = Tag.find(:all)
      unless params[:id].blank?
        _id = params[:id]
        _tag = Tag.find(_id)
        if current_user.tag_ids.include?(_id.to_i)
          current_user.tags.delete(_tag)
        else
          current_user.tags << _tag
        end
        redirect_to '/tags/follow_tag'
      end
    end
    
    # @followed_events = current_user.tags.collect{|x| x.id }
    _followed_event_ids = Eventtags.find(:all, :select=>["distinct(event_id)"], :conditions=>["tag_id in (?)", current_user.tag_ids]).collect{|x| x.event_id}
    @followed_events = Event.find(:all, :conditions=>["id in (?)", _followed_event_ids])
  end
  
end
