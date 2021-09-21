class ChangeDueDateToTasks < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tasks, :due_date, from: nil, to: -> { "now()" }
  end
end
