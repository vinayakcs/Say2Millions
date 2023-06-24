module SpamHelper


  def isSpamVoteproject(session)
   clear_anti_spamvote
   if !cookies.signed['antispam_tsv_count'].nil?
    if cookies.signed['antispam_tsv_count'] >= Rails.application.config.antispam_vote_count
     return true 
    end
   end 
     return false
  end


  def isSpamfeedback
   if !cookies.signed['anitspam_tsf'].nil?    
    submission_duration = Time.now - cookies.signed['anitspam_tsf'].to_time
    if submission_duration < Rails.application.config.antispam_duration
     return true 
    end
   end
     return false
  end


  def anti_spamfeedback
    cookies.signed['anitspam_tsf']= Time.now
  end

  def anti_spamvote
    cookies.signed['anitspam_tsv'] ||= Time.now
    cookies.signed['antispam_tsv_count'] ||=0
    cookies.signed['antispam_tsv_count']+=1
  end
  def clear_anti_spamvote
    if !cookies.signed['anitspam_tsv'].nil? && (Time.now - cookies.signed['anitspam_tsv'].to_time) > Rails.application.config.antispam_vote_duration
     cookies.signed['antispam_tsv_count']=0
     cookies.signed['anitspam_tsv']=nil
    end
  end

end
