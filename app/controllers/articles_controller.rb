class ArticlesController < ApplicationController
 include SanitizableParams
 include GlobalConstants
 include SessionsHelper
 impressionist :actions=>[:show]
 before_action :redirect_for_guest_user, :except => [:show,:index] 
 def show
  @article = Article.get(params[:id])
  puts @article.inspect
 end

 def index
  @isLastResults=false
  @articles = Article.get_articles_for_show(params[:page])
  @articles=@articles.get_articles_by_user(params[:user]) if(!params[:filter].blank? and params[:filter]=="user" and !params[:user].blank?)
  @articles = @articles.get_articles_with_category(params[:filter]) if (!params[:filter].blank? and GlobalConstants::CATEGORIES.include? params[:filter])
  @articles = @articles.get_articles_with_sort(params[:sort]) if (params[:sort].blank? or GlobalConstants::SORT_TYPE.include? params[:sort])
  if @articles.nil? || @articles.empty?
   @isLastResults=true
  end

  respond_to do |format|
    format.html { @articles }
    format.js { render :file => Rails.root.join("app/views/articles/load_more.js.erb")}             
    #format.rss
  end
 end


 def create
  if current_user.islucky == true && check_luckyuser_count 
   @article = Article.new
   @article.title = params[:article][:title]
   @article.user_id=current_user.id
   @article.fbuid=current_user.uid
   @article.category=params[:article][:category]
   @article.description = params[:article][:description]
   current_user.islucky=false
   ## do this in cron after making isvisble true current_user.update_article_count(true)
   current_user.articles << @article
   if current_user.save
    redirect_to root_url ,:notice => "Thank you for submitting your post, it will soon be viewed by millons !!"
    return
   else
    err_msg=""
    @article.errors.full_messages.each do |msg| 
     err_msg+=msg+","
     Rails.logger.error("Article Creation fails".to_s+msg)
    end
    
    redirect_to current_user, :notice => "Post not submitted errors: "+err_msg.chop
   end
  else
   Rails.logger.error("non lucky user attempts article creation or more than one lucky user".to_s+current_user.id)
  end
 end

 private
 def check_luckyuser_count 
  return User.getLuckyUserCount==1
 end

end

