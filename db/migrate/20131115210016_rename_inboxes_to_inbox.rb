class RenameInboxesToInbox < ActiveRecord::Migration
  def change
    rename_table :inboxes, :inbox
  end
end
