class SearchController < ApplicationController
  def index
    Mailer.test_email.deliver
  end
  
  def getResults
    keywords = params[:keywords].strip.gsub(/[^0-9A-Za-z]/, ' ').split(' ')
    users_conditions = ""
    events_conditions = ""
    for keyword in keywords
      users_conditions = users_conditions + "lcase(nickname) like '%#{keyword.downcase}%'"
      events_conditions = events_conditions + "lcase(theme) like '%#{keyword.downcase}%' or lcase(location) like '%#{keyword.downcase}%' or lcase(introduction) like '%#{keyword.downcase}%'"
      unless keyword == keywords.last
        users_conditions = users_conditions + " or "
        events_conditions = events_conditions + " or "
      end
    end
    @users_results = User.where(users_conditions)
    @events_results = Event.where(events_conditions)
    
    # puts users_conditions
  end
  
  def autocomplete
    if keyword = params[:keyword]
      nicknames = User.where("lcase(nickname) like '%#{keyword.downcase}%'").limit(5).collect{|x|  x.nickname}
      themes = Event.where("lcase(theme) like '%#{keyword.downcase}%'").limit(5).collect{|x| x.theme}
      @results = nicknames.join('$#') << '*#' << themes.join('$#')
    end
    render :layout => false
  end
end
