class ChangeMemoToTaskmemos < ActiveRecord::Migration[6.0]
  def change
    rename_table :memos, :taskmemos
  end
end
