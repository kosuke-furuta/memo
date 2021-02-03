class AddUserIdToMemos < ActiveRecord::Migration[6.0]
  def up
    execute 'DELETE FROM memos;'
    add_reference :memos, :user, null: false, index: true
  end

  def down
    remove_reference :memos, :user, index: true
  end
end
