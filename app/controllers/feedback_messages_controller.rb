class FeedbackMessagesController < ApplicationController
 include SpamHelper
  def create
   if !params[:email].blank? or isSpamfeedback
    redirect_to(root_path, :notice => 'Caught by spam filter,try submission later') 
   else
    @feedbackMessage=FeedbackMessage.new
    @feedbackMessage.name=params[:feedback_message][:name]
    @feedbackMessage.email=params[:feedback_message][:email]
    @feedbackMessage.content=params[:feedback_message][:content]
    @feedbackMessage.feedback_type=params[:feedback_message][:feedback_type]
    if @feedbackMessage.save
     anti_spamfeedback
     redirect_to(root_path, :notice => 'Thanks for sharing your feedback.') 
    else
     redirect_to(root_path, :notice => @feedbackMessage.errors.full_messages.first) 
    end
   end
  end
end
