module ApplicationHelper
 SITE_NAME = 'Say2Millions'
 def meta_keywords(str)
 ('<meta name="keywords" content="'.to_s + SITE_NAME.to_s + ' lucky winner,speak to millions,say to millions,crowd articles,confessions,love,frank,emotions,become a celebrity,get popular,get many friends,get respect,share your thoughts'.to_s + str.to_s + '">'.to_s).html_safe
 end
 def meta_desc(str)
('<meta name="description" content="login to '.to_s + SITE_NAME.to_s + 'and become a celebrity,make lots of friends, join and share your thoughts , Be the one'.to_s + str.to_s+ '">'.to_s).html_safe
 end
end
