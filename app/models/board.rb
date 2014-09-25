class Board < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable

  mount_uploader :image, BoardImageUploader

  validates :description, presence: true
end
