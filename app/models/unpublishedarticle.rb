class Unpublishedarticle < ActiveRecord::Base
 include GlobalConstants
 belongs_to :user
 profanity_filter :description, :title
 validates :description, presence: true, length: { maximum: 2000 }
 validates :title,presence: true, length: { maximum: 320 }
 validates :category,presence: true, inclusion: {in: GlobalConstants::CATEGORIES}

end
