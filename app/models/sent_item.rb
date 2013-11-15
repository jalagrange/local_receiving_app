class SentItem < ActiveRecord::Base
  set_table_name "sentitems"

  before_create :set_times
  before_save :set_timestamps

  private
    def set_times
      if self.InsertIntoDB == Date.new(0,0,0)
        self.InsertIntoDB = Time.now
      end

      if self.SendingDateTime == Date.new(0,0,0)
        self.SendingDateTime = Time.now
      end
    end

    def set_timestamps
      self.UpdatedInDB = Time.now
    end
end
