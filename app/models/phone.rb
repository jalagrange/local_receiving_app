class Phone < ActiveRecord::Base
  set_primary_key :IMEI

  before_create :set_times
  before_save :set_timestamps

  private
    def set_times
      if self.InsertIntoDB == Date.new(0,0,0)
        self.InsertIntoDB = Time.now
      end

      if self.TimeOut == Date.new(0,0,0)
        self.TimeOut = Time.now
      end
    end

    def set_timestamps
      self.UpdatedInDB = Time.now
    end
end
