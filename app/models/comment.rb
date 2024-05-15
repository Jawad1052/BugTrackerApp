class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :bug
  #belongs_to :manager
  #belongs_to :admin

  validates :content, presence: true, length: { maximum: 100 }
end
