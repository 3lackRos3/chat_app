class AddFieldsToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :caller_call_type, :string
    add_column :meetings, :receiver_call_type, :string
  end
end
