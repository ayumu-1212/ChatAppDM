class AddStudentIdToDirectMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :direct_messages, :student_id, :integer
  end
end
