class AddReceiverNumberAndCallerNumberToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :receiver_number, :integer
    add_column :meetings, :caller_number, :integer
  end
end
