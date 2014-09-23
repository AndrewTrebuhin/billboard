class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.text   :description
      t.string :image_url
      t.timestamps
    end
    add_reference :boards, :user, index: true
  end
end
