class Board < ActiveRecord::Base
  belongs_to :user

  mount_uploader :image, BoardImageUploader

  validates :description, presence: true
end
