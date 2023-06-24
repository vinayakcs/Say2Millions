module GlobalConstants
 extend ActiveSupport::Concern

 CATEGORIES=["Technology","Career","Love","Confession","Life","Politics","Social","Sports","Other"]

#contact_us.html.erb in layouts have the below mentioned value. one to one mapping is expected.
 FEEDBACK_TYPE=["Complaint","Appreciation"]

 SORT_TYPE_TRENDING="Trending"
 SORT_TYPE_VIEW="View"
 SORT_TYPE_RECENT="Recent"
 SORT_TYPE_VOTE="Vote" 
 SORT_TYPE=[SORT_TYPE_TRENDING,SORT_TYPE_VIEW,SORT_TYPE_RECENT,SORT_TYPE_VOTE]


end
