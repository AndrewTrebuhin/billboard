class Board < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable

  mount_uploader :image, BoardImageUploader

  validates :description, presence: true
  validates :user, presence: true

  def last_update
    updated_at.strftime("%d %b. %Y %H:%M") || created_at.strftime("%d %b. %Y %H:%M")
  end
end
