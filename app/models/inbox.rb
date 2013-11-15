class Inbox < ActiveRecord::Base
  set_table_name 'inbox'

  before_create :set_receiving_datetime
  before_save :set_timestamps

  private
    def set_receiving_datetime
      if self.ReceivingDateTime == Date.new(0,0,0)
        self.ReceivingDateTime = Time.now
    end

    def set_timestamps
      self.UpdatedInDB = Time.now
    end
end
