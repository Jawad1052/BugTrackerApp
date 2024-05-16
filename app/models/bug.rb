class Bug < ApplicationRecord
  belongs_to :user , optional: true
  #belongs_to :admin
  #belongs_to :manager
  has_many  :comments, dependent: :destroy

  attr_encrypted :location, key: 'a2abc3000f31fff29d446c83bd899321'

  validates :title, presence: true
  validates :description, presence: true
  validates :priority, presence: true

end
