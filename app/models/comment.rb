class Comment < ActiveRecord::Base

  belongs_to :commentable, :polymorphic => true
  has_many   :comments, :as => :commentable

  def board
    commentable.is_a?(Board) ? commentable : commentable.board
  end
end
