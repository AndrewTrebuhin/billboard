class RenameColumnInBoards < ActiveRecord::Migration
  def change
    rename_column :boards, :image_url, :image
  end
end
