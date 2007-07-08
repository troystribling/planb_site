class ForumsController < ApplicationController
  before_filter :login_required, :except => [ :index, :show ]
  before_filter :find_or_initialize_forum, :except => :index

  def index
    @forums = Forum.find(:all, :order => "position")
    # reset the page of each forum we have visited when we go back to index
    session[:forum_page]=nil
    respond_to do |format|
      format.html
      format.xml { render :xml => @forums.to_xml }
    end
  end

  def show
    respond_to do |format|
      format.html do
        # keep track of when we last viewed this forum for activity indicators
        (session[:forums] ||= {})[@forum.id] = Time.now.utc if logged_in?
        (session[:forum_page] ||= Hash.new(1))[@forum.id] = params[:page].to_i if params[:page]
        @topic_pages, @topics = paginate(:topics, :per_page => 25, :conditions => ['forum_id = ?', @forum.id], :include => :replied_by_user, :order => 'sticky desc, replied_at desc')
      end
      format.xml { render :xml => @forum.to_xml }
    end
  end

  # new renders new.rhtml
  
  def create
    @forum.attributes = params[:forum]
    @forum.save!
    respond_to do |format|
      format.html { redirect_to forums_path }
      format.xml  { head :created, :location => formatted_forum_url(:id => @forum, :format => :xml) }
    end
  end

  def update
    @forum.update_attributes!(params[:forum])
    respond_to do |format|
      format.html { redirect_to forums_path }
      format.xml  { head 200 }
    end
  end
  
  def destroy
    @forum.destroy
    respond_to do |format|
      format.html { redirect_to forums_path }
      format.xml  { head 200 }
    end
  end
  
  protected
    def find_or_initialize_forum
      @forum = params[:id] ? Forum.find(params[:id]) : Forum.new
    end

    alias authorized? admin?
end
